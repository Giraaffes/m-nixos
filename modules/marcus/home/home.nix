{ pkgs, pkgsUnstable, resolve, ... }:
let
  rclone-mount = import (resolve "lib/rclone-mount.nix") { pkgs = pkgsUnstable; };
  inherit (rclone-mount) mkRcloneMount;
in
{
  imports = [
    ./scripts.nix
  ];

  xdg.configFile."baloofilerc" = {
    text = ''
      [Basic Settings]
      Indexing-Enabled=false
    '';
    force = true;
  };

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

  home.stateVersion = "25.11";
}
