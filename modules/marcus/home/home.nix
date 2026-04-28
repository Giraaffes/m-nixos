{ pkgs, pkgsUnstable, resolve, ... }:
let
  rclone-master = import (resolve "pkgs/rclone-master.nix") { inherit pkgsUnstable; };
in
{
  xdg.configFile."baloofilerc" = {
    text = ''
      [Basic Settings]
      Indexing-Enabled=false
    '';
    force = true;
  };

  home.packages = with pkgs; [
    prismlauncher
    rclone-master
  ];

  systemd.user.services.icloud-mount = {
    Unit = {
      Description = "Mount iCloud Drive via Rclone";
      After = [ "network-online.target" ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/iCloud";
      ExecStart = "${rclone-master}/bin/rclone mount icloud: %h/iCloud --vfs-cache-mode full";
      ExecStop = "${pkgs.fuse}/bin/fusermount -u %h/iCloud";
      
      Restart = "on-failure";
      RestartSec = "10s";
      
      Environment = "PATH=${rclone-master}/bin:${pkgs.coreutils}/bin:/run/wrappers/bin";
    };
  };

  home.stateVersion = "25.11";
}
