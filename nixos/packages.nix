{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.home-manager.packages.${pkgs.system}.default
    neovim
    vim
    curl
    git
    python3
    sudo
    networkmanager
    nodejs
    xterm
  ];
}
