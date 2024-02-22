{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    vim
    curl
    git
    python
    sudo
    networkmanager
    nodejs
    xterm
  ];
}
