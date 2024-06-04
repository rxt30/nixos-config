{ ... }:
{
  services.hypridle = {
    enable = true;
    settings =
      {
        general =
          {
            lock_cm = "pidof hyprlock || hyprlock";
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "hyprctl dispatch dpms on";
          };
        listener = [
          {
            timeout = 600;
            on-timeout = "loginctl lock-session";
          }
          { timeout = 620; on-timeout = "hyprctl dispatch dpms off"; on-resume = "hyprctl dispatch dpms on"; }
          { timeout = 1800; on-timeout = "systemctl suspend"; }
        ];
      };
  };
}
