{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.foot.enable = true;
  xdg.configFile."foot".source = ./config;
}
