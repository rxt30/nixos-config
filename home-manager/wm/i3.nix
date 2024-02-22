{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = ''
      set $mod Mod1
      set $win Mod4
      ${builtins.readFile ../config/i3/autostart.conf}
      ${builtins.readFile ../config/i3/keybinds.conf}
      ${builtins.readFile ../config/i3/styling.conf}
    '';
  };
  programs.i3status.enable = true;
  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ../config/kitty/kitty.conf} 
    '';
  };
  home.file.workspace-switch = {
    source = ../config/i3/switch_workspace.py;
    target = ".config/i3/switch_workspace.py";
  };
}
