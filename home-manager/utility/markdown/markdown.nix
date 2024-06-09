{ pkgs, ... }:
{
  programs.neovim.extraPackages = with pkgs; [
    cbfmt
    python311Packages.mdformat-gfm
    marksman
    deno
  ];
  # xdg.configFile."nvim/lua/plugins/markdown.lua".source = ./markdown.lua;
}
