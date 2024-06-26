{ ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar =
        {
          position = "top";
          height = 30;
          layer = "top";
          modules-left = [ "hyprland/workspaces" ];
          modules-right = [ "pulseaudio" "battery" "battery#bat2" "network" "backlight" "clock" "tray" ];

          clock = {
            format = "{:%d/%m/%Y %H:%M}";
          };

          memory = {
            format = "{used:0.1f} GB/{total:0.1f} GB";
          };

          backlight = {
            format = " {percent}%";
            on-scroll-up = "brightnessctl set 5%+";
            on-scroll-down = "brightnessctl set 5%-";

          };

          "custom/power" = {
            format = "<span size=\"x-large\"></span>";
            on-click = "wlogout";
          };

          "custom/searchMenu" = {
            format = "<span size=\"x-large\"></span>";
            on-click = "nwggrid";
          };

          "custom/spotify" = {
            format = "{}";
            exec = "playerctl --no-messages metadata --follow --format ' {{title}}   {{artist}}'";
          };

          battery = {
            interval = 10;
            format = "{icon} {capacity}%";
            states = {
              warning = 25;
              critical = 15;
            };
            format-icons = {
              discharging = [ "" "󰁺" "󰁻" "" "" "" "" "󰂀" "󰂁" "󰂂" "" ];
              plugged = "󰂄";
              charging = "󰂄";
            };
          };

          "battery#bat2" = {
            interval = 10;
            format = " {power} W";
          };

          pulseaudio = {
            on-click = "pavucontrol";
            on-click-right = "pulsemixer --toggle-mute";
            format = "{icon} {volume}%";
            format-muted = "婢 Muted";
            format-icons = {
              default = [ "奄" "奔" "墳" ];
            };
          };

          network = {
            interface = "wlan0";
            format = "{ifname}";
            format-wifi = "{essid} ({signalStrength}%) ";
            format-disconnected = "";
            tooltip-format = "{ifname} via {gwaddr} ";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            tooltip-format-ethernet = "{ifname} ";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
            on-click = "alacritty -e nmtui";
          };


          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            format-icons = {
              active = "󰊠";
              default = "";
            };
            sort-by-number = true;
          };

        };
    };
  };
  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/mocha.css".source = ./mocha.css;
}
