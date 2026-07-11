{
  description = "Yume neovim colorscheme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        git
        just
        stylua
        selene
      ];
    };
  };
}
