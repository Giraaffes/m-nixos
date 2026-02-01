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

  home-manager.users.marcus.home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos#marcus-far";
    rebuild-logout = "sudo nixos-rebuild switch --flake ~/nixos#marcus-far && qdbus org.kde.Shutdown /Shutdown logout";
    rebuild-reboot = "sudo nixos-rebuild boot --flake ~/nixos#marcus-far && reboot";
  };
}

