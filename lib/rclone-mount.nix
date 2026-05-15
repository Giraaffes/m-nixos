{ pkgs }:
{
  mkRcloneMount = { name, remote, mountDir }: {
    Unit = {
      Description = "Mount ${name} via Rclone";
      After = [ "network-online.target" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountDir}";
      ExecStart = "${pkgs.rclone}/bin/rclone mount ${remote} ${mountDir} --vfs-cache-mode full";
      ExecStop = "${pkgs.fuse}/bin/fusermount -u ${mountDir}";
      Restart = "on-failure";
      RestartSec = "10s";
      Environment = "PATH=${pkgs.rclone}/bin:${pkgs.coreutils}/bin:/run/wrappers/bin";
    };
  };
}