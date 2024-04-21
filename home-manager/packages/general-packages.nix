{ config, pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    fish = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = false;
      icons = true;
      git = true;
    };
    ssh.addKeysToAgent = true;
  };

  services.ssh-agent.enable = true;
  home.packages = with pkgs; [
    conda
    nerdfonts
    htop
  ];
}
