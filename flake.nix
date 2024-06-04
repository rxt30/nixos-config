{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyprlock.url = "github:hyprwm/Hyprlock";
    # hypridle.url = "github:hyprwm/Hypridle";
    # hyprpaper.url = "github:hyprwm/Hyprpaper";

    musnix.url = "github:musnix/musnix";
    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
      # , hyprlock
      # , hypridle
      # , hyprpaper
    , musnix
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        maxh-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            musnix.nixosModules.musnix
            ./nixos/maxh/configuration.nix
          ];
        };
        mime-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [ ./nixos/mime/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "maxh@maxh-nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          # > Our main home-manager configuration file <
          modules = [
            # hyprlock.homeManagerModules.hyprlock
            # hypridle.homeManagerModules.hypridle
            # hyprpaper.homeManagerModules.hyprpaper
            ./home-manager/maxh.nix
          ];
        };
        "mime@maxh-nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          # > Our main home-manager configuration file <
          modules = [
            # hyprlock.homeManagerModules.hyprlock
            # hypridle.homeManagerModules.hypridle
            # hyprpaper.homeManagerModules.hyprpaper
            ./home-manager/mime.nix
          ];
        };
      };
    };
}
