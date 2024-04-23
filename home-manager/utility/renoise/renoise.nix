{ pkgs, ... }:
{
  home.packages = with pkgs; [
    renoise
    yabridge
    yabridgectl
    synthv1
    vital
  ];
}
