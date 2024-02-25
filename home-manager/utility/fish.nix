{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
  };
  
  home.file.fish-config = {
    source = ../config/fish/config.fish;
    target = ".config/fish/config.fish";
  };
  home.file.catppuccin-latte = {
    source = ../config/fish/themes/Catppuccin-Latte.theme;
    target = ".config/fish/themes/Catppuccin-Latte.theme";
  };
  home.file.catppuccin-mocha = {
    source = ../config/fish/themes/Catppuccin-Mocha.theme;
    target = ".config/fish/themes/Catppuccin-Mocha.theme";
  };
}
