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
        customRC = ''
          lua << EOF
          vim.o.tabstop = 2
          vim.o.expandtab = true
          vim.o.termguicolors = true
          vim.o.shiftwidth = 2
          vim.o.number = true
          vim.o.relativenumber = true
          vim.o.signcolumn = 'yes:1'

          require('lualine').setup({ options = { theme = "yume" } })
          EOF
        '';

        packages = {
          yume = {
            start = [yume];
            opt = [];
          };
          lualine = {
            start = [pkgs.vimPlugins.lualine-nvim];
            opt = [];
          };
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
