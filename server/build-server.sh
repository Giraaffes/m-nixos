nix build .#nixosConfigurations.server.config.system.build.digitalOceanImage --extra-experimental-features nix-command --extra-experimental-features flakes
