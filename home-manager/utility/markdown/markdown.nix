{ pkgs, ... }:
{
  programs.neovim.extraPackages = with pkgs; [
    cbfmt
    mdformat
    marksman
    deno
  ];
  xdg.configFile."nvim/lua/plugins/markdown.lua".source = ./markdown.lua;
}
