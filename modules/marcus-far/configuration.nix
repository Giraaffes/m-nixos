{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  swapDevices = [{ device = "/swapfile"; size = 8 * 1024; }];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "marcus-far";

  hardware.usb-modeswitch.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821au
    rtl8821cu
  ];
  
  environment.systemPackages = with pkgs; [
    usbutils
    usb-modeswitch
  ];
}

