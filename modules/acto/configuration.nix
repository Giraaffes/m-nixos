{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  swapDevices = [{ device = "/swapfile"; size = 8 * 1024; }];

  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.timeoutStyle = "hidden";

  networking.hostName = "acto";
}

