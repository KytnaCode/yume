{
  description = "Yume neovim colorscheme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};

    yume = pkgs.vimUtils.buildVimPlugin {
      pname = "yume";
      version = "0.1.0";
      src = ./.;
    };

    neovim-dev = pkgs.neovim.override {
      configure = {
        packages.yume = {
          start = [yume];
          opt = [];
        };
      };
    };
  in {
    devShells.${system}.default = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        git
        just
        neovim-dev
        stylua
        selene
      ];
    };
  };
}
