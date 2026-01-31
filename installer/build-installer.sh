# nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=installer.nix -o installer-result

nix build .#nixosConfigurations.installer.config.system.build.isoImage --extra-experimental-features nix-command --extra-experimental-features flakes
