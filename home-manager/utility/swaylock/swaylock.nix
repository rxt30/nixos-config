{ ... }:
{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      image = "~/.config/swaylock/wall.png";
      indicator-idle-visible = true;
    };
  };
  xdg.configFile."swaylock/wall.png".source = ./wall.png;
}
