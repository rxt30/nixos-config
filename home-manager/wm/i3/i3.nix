{ config, pkgs, lib, ... }:
let
  mod = "Mod1";
  win = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      floating.modifier = mod;
      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec alacritty";
        "${mod}+q" = "kill";
        "${mod}+p" = "exec \"rofi -modi drun, run -show drun\"";
        "Print" = "exec \"grimshot save area - | swappy -f -\"";
        "$win+Shift+p" = "exec \"~/.config/sway/duplicateDisplay.sh\"";
        "${mod}+b" = "exec \"firefox\"";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+Control+h" = "split h";
        "${mod}+Control+v" = "split v";

        "${mod}+f" = "fullscreen toggle";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+space" = "floating toggle";

        "${mod}+1" = "workspace number \"1\"";
        "${mod}+2" = "workspace number \"2\"";
        "${mod}+3" = "workspace number \"3\"";
        "${mod}+4" = "workspace number \"4\"";
        "${mod}+5" = "workspace number \"5\"";
        "${mod}+6" = "workspace number \"6\"";
        "${mod}+7" = "workspace number \"7\"";
        "${mod}+8" = "workspace number \"8\"";
        "${mod}+9" = "workspace number \"9\"";
        "${mod}+0" = "workspace number \"10\"";
        "${mod}+u" = "exec \"python ~/.config/i3/switch_workspace.py -b\"";
        "${mod}+o" = "exec \"python ~/.config/i3/switch_workspace.py\"";

        "${mod}+Shift+1" = "move container to workspace number \"1\"";
        "${mod}+Shift+2" = "move container to workspace number \"2\"";
        "${mod}+Shift+3" = "move container to workspace number \"3\"";
        "${mod}+Shift+4" = "move container to workspace number \"4\"";
        "${mod}+Shift+5" = "move container to workspace number \"5\"";
        "${mod}+Shift+6" = "move container to workspace number \"6\"";
        "${mod}+Shift+7" = "move container to workspace number \"7\"";
        "${mod}+Shift+8" = "move container to workspace number \"8\"";
        "${mod}+Shift+9" = "move container to workspace number \"9\"";
        "${mod}+Shift+0" = "move container to workspace number \"10\"";
        "${mod}+Shift+u" = "exec \"python ~/.config/i3/switch_workspace.py -c -b && python ~/.config/i3/switch_workspace.py -b\"";
        "${mod}+Shift+o" = "exec \"python ~/.config/i3/switch_workspace.py -c && python ~/.config/i3/switch_workspace.py\"";

        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+q" = "quit";

        # Special lock command
        # "${win}+l" = "exec ${lock}"; 

        # Bind special keyboard keys
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # Scratchpad keys
        "${mod}+m" = "move scratchpad";
        "${mod}+Tab" = "scratchpad show";
      };
      startup = [
        {
          command = "autorandr --change";
          always = true;
        }
        {
          command = "dunst";
        }
      ];
      fonts = {
        names = [ "pango:DejaVu Sans Mono 9" ];
      };
      gaps = {
        smartGaps = true;
        inner = 5;
      };
    };
  };
  programs.i3status.enable = true;
  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ../../utility/kitty/kitty.conf} 
    '';
  };
  home.file.workspace-switch = {
    source = ./scripts/switch_workspace.py;
    target = ".config/i3/switch_workspace.py";
  };
  xsession.enable = true;
}
