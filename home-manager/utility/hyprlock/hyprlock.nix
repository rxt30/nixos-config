{ pkgs, ... }:
{
  programs.hyprlock =
    {
      enable = true;
      settings = {
        general = {
          no_fade_in = true;
          no_fade_out = true;
          ignore_empty_input = true;
        };
        background = [{
          path = "~/.config/hyprlock/wall.png";
        }];
        input-field = [{
          fade_on_empty = false;
        }];
        label = [{
          text = "Welcome back, it's currently $TIME";
        }];
      };
    };
  xdg.configFile."hyprlock/wall.png".source = ./wall.png;
}
