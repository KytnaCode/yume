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

          require('lualine').setup({
            options = {
              theme = "yume",
              component_separators = '|',
              section_separators = { left = '', right = '' },
            },
            sections = {
              lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
              lualine_b = { 'filename', 'branch' },
              lualine_c = {
                '%=', --[[ add your center components here in place of this comment ]]
              },
              lualine_x = {},
              lualine_y = { 'filetype', 'progress' },
              lualine_z = {
                { 'location', separator = { right = '' }, left_padding = 2 },
              },
            },
          })

          require('neo-tree').setup({})
          EOF
        '';

        packages = {
          yume = {
            start = [yume];
            opt = [];
          };
          nvim-web-dev-icons = {
            start = [pkgs.vimPlugins.nvim-web-devicons];
          };
          nui = {
            start = [pkgs.vimPlugins.nui-nvim];
          };
          plenary = {
            start = [pkgs.vimPlugins.plenary-nvim];
          };
          neo-tree = {
            start = [pkgs.vimPlugins.neo-tree-nvim];
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
