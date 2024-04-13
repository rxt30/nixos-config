{ ... }:
{
  programs.hyprlock = {
      enable = true;
      general = {
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };
      background = {
        path = "~/.config/hyprlock/wall.png";
      };
      prompt = {
        fade_on_empty = false;
        };
      label = {
        text = "Welcome back, $USER";
      };
    };
  xdg.configFile."hyprlock/wall.png".source = ./wall.png;
}
