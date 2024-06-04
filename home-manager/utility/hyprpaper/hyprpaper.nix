{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.config/hyprpaper/wall.png"
      ];
      wallpaper = [
        ",contain:~/.config/hyprpaper/wall.png"
      ];
    };
  };
  xdg.configFile."hyprpaper/wall.png".source = ./wall.png;
}
