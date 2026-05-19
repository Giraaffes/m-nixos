{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  home-manager.users.marcus.imports = [ ./home/home.nix ];

  networking.hostName = "acto";

  boot.loader = {
    timeout = 1;
    grub.device = "nodev";
    grub.efiSupport = true;
    grub.timeoutStyle = "hidden";
  };

  swapDevices = [{ device = "/swapfile"; size = 8 * 1024; }];

  # Android environemnt
  users.users.marcus.extraGroups = [ "kvm" ];
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 524288;
    "fs.inotify.max_user_instances" = 8192;
  };
}

