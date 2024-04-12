{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = no;
        layer = overlay;
        width = 100;
      };
      colors = {
        background = "1e1e2eff";
        text = "cdd6f4ff";
        match = "f387ba8ff";
        selection = "313244ff";
        selection-text = "cdd6f4ff";
        selection-match = "f38ba8ff";
      };
    };
  };
}
