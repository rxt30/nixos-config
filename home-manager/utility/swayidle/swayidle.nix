{ ... }:
{
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "swaylock"; }
    ];
    timeouts = [
      { timeout = 600; command = "swaylock"; }
      { timeout = 610; command = "hyprctl dispatch dpms off"; }
    ];
  };
}
