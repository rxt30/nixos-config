{ inputs
, lib
, config
, pkgs
, ...
}: {
  services.kanshi = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      profiles = {
          undocked = {
              outputs = [
              {
                  criteria = "eDP-1";
                  status = "enable";
                }
              ];
            };
          docked = {
              outputs = [
              {
                  criteria = "Acer Technologies XV242Y TL1EE0018521";
                  status = "enable";
                  position = "0,0";
                  mode = "1920x1080@60Hz";
                }
              {
                  criteria = "Philips Consumer Electronics Company PHL 243V5 ZV01449014849";
                  status = "enable";
                  position = "1920,0";
                  mode = "1920x1080@60Hz";
                }
              {
                  criteria = "eDP-1";
                  status = "enable";
                  position = "3840,0";
                  mode = "1920x1080@60Hz";
                }
              ];
            };
        };
    };
}
