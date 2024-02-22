{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    vim
    curl
    git
    python
    sudo
    nmtui
    nodejs
    xterm
  ];
}
