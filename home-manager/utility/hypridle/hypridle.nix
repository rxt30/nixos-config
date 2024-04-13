{ ... }:
{
  services.hypridle = {
    enable = true;
    lockCmd = "pidof hyprlock || hyprlock";
    beforeSleepCmd = "loginctl lock-session";
    afterSleepCmd = "hyprctl dispatch dpms on";
    listeners = [
      { timeout = 600; onTimeout = "loginctl lock-session"; }
      { timeout = 620; onTimeout = "hyprctl dispatch dpms off"; onResume = "hyprctl dispatch dpms on"; }
      { timeout = 1800; onTimeout = "systemctl suspend"; }
    ];
  };
}
