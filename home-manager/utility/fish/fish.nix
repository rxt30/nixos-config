{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.fish = {
    enable = true;
    # shellInit = ''
    #   ${builtins.readFile ../config/fish/config.fish}
    # '';
    shellAliases = {
      hex = "math --base=hex";
    };

    shellInit = ''
      if command -q eza
        alias lss="eza -la"
        alias ls="eza -l --icons"
        alias l="eza"
      end

      bind \cb "cd ..; commandline -f repaint"
    '';

  };

  # home.file.fish-config = {
  #   source = ../config/fish/config.fish;
  #   target = ".config/fish/config.fish";
  # };
  xdg.configFile."fish/themes".source = ./themes;
}
