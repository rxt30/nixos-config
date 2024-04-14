{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = ["--all"];
    settings = {
      input = {
        kb_layout = "de";
        kb_options = "caps:escape";
        repeat_rate = 30;
        repeat_delay = 200;
        follow_mouse = 2;
        touchpad = {
          natural_scroll = false;
        };
      };

      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "0xffa6e3a1";
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        mouse_move_enables_dpms = true;
      };

      monitor = ",preferred,auto,1";
      bind = [
        # Workspace stuff
        "ALT,u,workspace,r-1"
        "ALT,o,workspace,r+1"
        "ALT,TAB,togglespecialworkspace"
        "ALTSHIFT,u,movetoworkspace,r-1"
        "ALTSHIFT,o,movetoworkspace,r+1"
        "ALTSHIFT,TAB,movetoworkspace,special"

        # Application
        "ALT,RETURN,exec,foot"
        "ALT,b,exec,firefox"
        "ALT,q,killactive"
        "ALT CTRL,q,exit"
        "ALT,p,exec,fuzzel"
        "SUPER,l,exec,swaylock"

        # Window management
        "ALT,SPACE,togglefloating,"
        "ALT SHIFT,f,fullscreen,0"
        "ALT,f,fullscreen,1"

        # Focus binds
        "ALT,h,movefocus,l"
        "ALT,j,movefocus,d"
        "ALT,k,movefocus,u"
        "ALT,l,movefocus,r"
        "ALT SHIFT,h,focusmonitor,l"
        "ALT SHIFT,l,focusmonitor,r"

        # Move windows
        "ALT,Left,movewindow,l"
        "ALT,Right,movewindow,r"
        "ALT SHIFT,Left,movewindow,mon:l"
        "ALT SHIFT,Right,movewindow,mon:r"

        # Mic Mute
        ",XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "ALT,mouse:272,movewindow"
        "ALT,mouse:273,resizewindow"
      ];

      bindel = [
        ",XF86MonBrightnessUp,exec,brightnessctl set 5%+"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ];

      binde = [
        ",XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%"
      ];

      bindl = [
        ",XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ];

      exec-once = [
        "dunst"
        "waybar"
        "flameshot"
        "kanshi"
        "swayidle"
        "hyprpaper"
        "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --start-minimized"
      ];

      animation = [
        "workspaces,1,3,default"
        "workspaces,1,3,default"
      ];
    };

    extraConfig = ''
      bind=ALT,escape,submap,passall
      submap=passall
      bind=ALT,escape,submap,reset
      submap=reset
    '';
  };

  imports = [
    ../../utility/foot/foot.nix
    ../../utility/fuzzel/fuzzel.nix
    ../../utility/dunst/dunst.nix
    ../../utility/waybar/waybar.nix
    ../../utility/kanshi/kanshi.nix
    ../../utility/hyprlock/hyprlock.nix
    ../../utility/hypridle/hypridle.nix
    ../../utility/hyprpaper/hyprpaper.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    brightnessctl
  ];
}
