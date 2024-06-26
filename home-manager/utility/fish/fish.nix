{ ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      hex = "math --base=hex";
      nix-config = "cd ~/Documents/projects/nix-config";
      thesis = "cd ~/Documents/tuD/thesis/thesis/thesis/";
      scripts = "cd ~/Documents/tuD/thesis/thesis/scripts/ && conda activate thesis";
      hypridle-stop = "systemctl --user stop hypridle";
      hypridle-start = "systemctl --user start hypridle";
      vim = "nvim";
      hs = "home-manager switch --flake .#maxh@maxh-nixos --extra-experimental-features nix-command --extra-experimental-features flakes";
    };

    shellInit = ''
      bind \cb "cd ..; commandline -f repaint"
      fish_add_path -aP ~/.nix-profile/bin/
      if command -q eza
        alias lss="eza -la"
        alias ls="eza -l --icons --git"
        alias l="eza"
      end

      
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      if test -f /home/maxh/miniconda3/bin/conda
          eval /home/maxh/miniconda3/bin/conda "shell.fish" "hook" $argv | source
      else
          if test -f "/home/maxh/miniconda3/etc/fish/conf.d/conda.fish"
              . "/home/maxh/miniconda3/etc/fish/conf.d/conda.fish"
          else
              set -x PATH "/home/maxh/miniconda3/bin" $PATH
          end
      end
      # <<< conda initialize <<<
    '';

  };

  # home.file.fish-config = {
  #   source = ../config/fish/config.fish;
  #   target = ".config/fish/config.fish";
  # };
  xdg.configFile."fish/themes".source = ./themes;
}
