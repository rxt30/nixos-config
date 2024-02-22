{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar = {
    enable = true;
  };

  programs.foot = {
    enable = true;
  };

  # enable rofi
  # enable dunst
}
