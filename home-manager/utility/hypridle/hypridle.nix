{ ... }:
{
  programs.hypridle = {
    enable = true;
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
      beforeSleepCmd = "loginctl lock-session";
      afterSleepCmd = "hyprctl dispatch dpms on";
    };
    listeners = [
      { timeout = 600; on-timeout = "loginctl lock-session"; }
      { timeout = 620; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
      { timeout = 1800; on-timeout = "systemctl suspend"; }
    ];
  };
}
