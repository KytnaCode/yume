package main

import (
	"context"
	"crypto/tls"
	"os"
	"os/signal"
	"rui-app/internal/admin/adminpost"
	"rui-app/internal/auth"
	"rui-app/internal/config"
	"rui-app/internal/database"
	"rui-app/internal/image"
	"rui-app/internal/logging"
	"rui-app/internal/post"
	"rui-app/internal/routes"
	"rui-app/internal/server"
	"rui-app/internal/session"
	"rui-app/internal/validate"
	"time"
)

const databaseShutdownTimeout = time.Minute

func main() {
	ok := run()
	if !ok {
		os.Exit(1)
	}
}

func run() bool {
	conf := config.FromEnv()

	logger := logging.New(conf.Debug)

	logger = logger.With(logging.Config(conf))

	validator, err := validate.New()
	if err != nil {
		logger.Error("could not setup validator", logging.Error(err))

		return false
	}

	if err = conf.Validate(validator); err != nil {
		logger.Error("invalid config", logging.Error(err))

		return false
	}

	ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt)
	defer cancel()

	authClient, err := auth.Connect(ctx, &auth.ClientConfig{
		ClientSecret: conf.AuthProvider.ClientSecret,
		ClientID:     conf.AuthProvider.ClientID,
		ProviderURL:  conf.AuthProvider.URL,
		RedirectURL:  conf.AuthProvider.RedirectUrl,
	})
	if err != nil {
		logger.Error("could not connect to oidc provider", logging.Error(err))

		return false
	}

	db, err := database.Connect(ctx, &conf.Database)
	if err != nil {
		logger.Error("could not connect to database", logging.Error(err))

		return false
	}
	defer func() {
		shutdownCtx, cancel := context.WithTimeout(context.Background(), databaseShutdownTimeout)
		defer cancel()

		err := db.Close(shutdownCtx)
		if err != nil {
			logger.Error("error closing database connection", logging.Error(err))
		}
	}()

	sessionStore := session.NewStore()

	authMiddleware := auth.NewMiddleware(authClient, sessionStore, logger)

	authHandler := auth.NewHandler(logger, authClient, sessionStore)

	imageService := image.NewService(conf.ImagesFile)

	imageHandler := image.NewHandler(imageService, logger, "/api/images")

	postRepo := post.NewRepository(db, validator)

	postHandler := post.NewHandler(
		postRepo,
		logger,
		image.BuildURL(conf.ImageForceSSL),
		imageService,
		validator,
	)

	adminPostHandler := adminpost.NewHandler(
		imageService,
		postRepo,
		image.BuildURL(conf.ImageForceSSL),
		logger,
	)

	routerConf := &routes.Config{
		Debug:            conf.Debug,
		Logger:           logger,
		AuthHandler:      authHandler,
		ImageHandler:     imageHandler,
		PostHandler:      postHandler,
		AdminPostHandler: adminPostHandler,
		AuthMiddleware:   authMiddleware,
	}

	h := routes.SetupRouter(routerConf)

	ok := true

	logger.Info("starting server")

	var tlsConfig *tls.Config

	if conf.CertificateFile != "" && conf.KeyFile != "" {
		cert, err := tls.LoadX509KeyPair(conf.CertificateFile, conf.KeyFile)
		if err != nil {
			logger.Error("could not load tls certificates", logging.Error(err))

			return false
		}

		tlsConfig = &tls.Config{
			Certificates: []tls.Certificate{cert},
		}
	}

	if err := server.Listen(ctx, conf.Addr, h, tlsConfig); err != nil {
		logger.Error("error on server listen", logging.Error(err))

		ok = false
	}

	logger.Info("stopping server")

	return ok
}
