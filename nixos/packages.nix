{ config, pkgs, ... }:
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    unstable.neovim
    unstable.vim
    curl
    unstable.eza
    git
    unstable.python
    sudo
    nmtui
    unstable.nodejs
    xterm
  ];
}
