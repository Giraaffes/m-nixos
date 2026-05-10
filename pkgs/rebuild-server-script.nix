{ pkgs, flakePath, ... }:
pkgs.writeShellApplication {
  name = "rebuild-server";
  text = ''
    if [[ $# -lt 1 ]]; then
      echo "Usage: rebuild-server <host>"
      exit 1
    fi

    HOST="$1"
    nixos-rebuild switch --flake "${flakePath}#server" --target-host "$HOST" --sudo
  '';
}
