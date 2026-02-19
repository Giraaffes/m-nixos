{
  description = "My NixOS flake";

  inputs = {
    pkgs = {
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

  outputs = { pkgs, home-manager, plasma-manager, nur, ... }:
  let
    resolve = path: ./. + ("/" + path);
    mkSystems = configAttrs: builtins.mapAttrs (
      hostName: hostConfig: pkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit hostName; inherit resolve; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          { home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ]; }
          ./common/configuration.nix
          hostConfig
        ];
      }
    ) configAttrs;
  in
  {
    nixosConfigurations = mkSystems {
      marcus-mor = ./hosts/marcus-mor/configuration.nix;
      marcus-far = ./hosts/marcus-far/configuration.nix;
      acto = ./hosts/acto/configuration.nix;
    } // {
      installer = pkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${pkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./installer/installer.nix
        ];
      };
    };
  };
}
