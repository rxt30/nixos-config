{ pkgs, ... }:
{
  programs.neovim.extraPackages = with pkgs; [
    black
    pyright
    # pylsp
    # pylyzer
    conda
  ];
  # xdg.configFile."nvim/lua/plugins/python.lua".source = ./python.lua;
  home.packages = with pkgs; [
    python3
    python311Packages.numpy
  ];
}
