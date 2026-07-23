{
  description = "Yume neovim colorscheme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux"];
    eachSystem = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs {inherit system;}));

    get-yume = pkgs:
      pkgs.vimUtils.buildVimPlugin {
        pname = "yume";
        version = "0.1.0";
        src = ./.;
      };

    get-neovim = pkgs:
      pkgs.neovim.override {
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

            require('yume').setup({
              integrations = {
                neotree = true,
              },
            })

            vim.cmd('colorscheme yume')
            EOF
          '';

          packages = {
            yume = {
              start = [get-yume pkgs];
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
    devShells = eachSystem (pkgs: {
      default = let
        neovim-dev = get-neovim pkgs;
      in
        pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            git
            just
            neovim-dev
            stylua
            selene
          ];
        };
    });

    packages = eachSystem (pkgs: let
      yume = get-yume pkgs;
    in {
      inherit yume;

      default = yume;
    });
  };
}
