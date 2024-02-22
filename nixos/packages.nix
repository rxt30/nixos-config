{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    vim
    curl
    eza
    git
    python
    sudo
    nmtui
    nodejs
  ];
}
