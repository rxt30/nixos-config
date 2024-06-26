{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # texliveFull
  ];
  programs.neovim.extraPackages = with pkgs; [
    ltex-ls
    texlab
  ];
  xdg.configFile."nvim/lua/plugins/latex.lua".source = ./latex.lua;
}
