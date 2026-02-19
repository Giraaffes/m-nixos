{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "marcus-far";

  hardware.usb-modeswitch.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821au
  ];
  
  environment.systemPackages = with pkgs; [
    usbutils
    usb-modeswitch
  ];
}

