{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  swapDevices = [{ device = "/swapfile"; size = 1 * 1024; }];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "marcus-mor";

  hardware.usb-modeswitch.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821cu
  ];

  services.udev.extraRules = ''
    ACTION=="add", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 0bda -p 1a2b -K"
  '';
  
  environment.systemPackages = with pkgs; [
    usbutils
    usb-modeswitch
  ];

  services.xserver.enable = true;
}

