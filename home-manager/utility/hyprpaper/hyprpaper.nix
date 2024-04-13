{ ... }:
{
  services.hyprpaper = {
      enable = true;
      preloads = [
        "~/.config/hyprpaper/wall.png"
      ];
      wallpapers = [
        ",contain:~/.config/hyprpaper/wall.png"
      ];
    };
  xdg.configFile."hyprpaper/wall.png".source = ./wall.png;
}
