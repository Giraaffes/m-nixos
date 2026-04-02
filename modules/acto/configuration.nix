{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.timeoutStyle = "hidden";

  networking.hostName = "acto";
}

