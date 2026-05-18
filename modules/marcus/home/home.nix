{ pkgs, pkgsUnstable, resolve, ... }:
let
  rclone-mount = import (resolve "lib/rclone-mount.nix") { pkgs = pkgsUnstable; };
  inherit (rclone-mount) mkRcloneMount;
in
{
  imports = [
    ./scripts.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    pkgsUnstable.rclone
    keepassxc
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "elephant" = {
        hostname = "46.101.155.176";
        user = "root";
        identitiesOnly = true;
        identityFile = "~/.ssh/id_elephant";
      };
      "pi" = {
        hostname = "192.168.1.13";
        user = "marcus";
        identitiesOnly = true;
        identityFile = "~/.ssh/id_pi";
      };
    };
  };

  systemd.user.services = {
    "icloud-mount" = mkRcloneMount {
      name = "iCloud Drive";
      remote = "icloud:";
      mountDir = "%h/iCloud";
    };
    "gdrive-mount" = mkRcloneMount {
      name = "Google Drive";
      remote = "google:";
      mountDir = "%h/drive";
    };
  };

  xdg.configFile."baloofilerc" = {
    text = ''
      [Basic Settings]
      Indexing-Enabled=false
    '';
    force = true;
  };

  home.stateVersion = "25.11";
}
