{
  description = "My NixOS flake";

  inputs = {
    pkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    pkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "pkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "pkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "pkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { pkgs, pkgs-unstable, home-manager, plasma-manager, nur, ... }:
  let
    resolve = path: ./. + ("/" + path);
    pkgsUnstable = import pkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    mkSystems = hosts: builtins.mapAttrs (
      hostName: hostModules: pkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit hostName; inherit resolve; inherit pkgsUnstable; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          { home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ]; }
        ] ++ hostModules;
      }
    ) hosts;
  in
  {
    nixosConfigurations = mkSystems {
      marcus-mor = [
        ./modules/common/configuration.nix
        ./modules/marcus/configuration.nix
        ./modules/marcus-mor/configuration.nix
      ];
      marcus-far = [
        ./modules/common/configuration.nix
        ./modules/marcus/configuration.nix
        ./modules/marcus-far/configuration.nix
      ];
      acto = [
        ./modules/common/configuration.nix
        ./modules/acto/configuration.nix
      ];
    } // {
      installer = pkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${pkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./installer/configuration.nix
        ];
      };
      server = pkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${pkgs}/nixos/modules/virtualisation/digital-ocean-image.nix"
          ./server/configuration.nix
        ];
      };
    };
  };
}
