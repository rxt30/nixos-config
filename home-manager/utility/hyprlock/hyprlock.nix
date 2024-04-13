{ ... }:
{
  programs.hyprlock = {
      enable = true;
      general = {
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };
      backgrounds = [{
        path = "~/.config/hyprlock/wall.png";
      }];
      input-fields = [{
        fade_on_empty = false;
        }];
      labels = [{
        text = "Welcome back, it's currently $TIME";
      }];
    };
  xdg.configFile."hyprlock/wall.png".source = ./wall.png;
}
