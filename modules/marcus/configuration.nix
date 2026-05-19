{ ... }:
{
  home-manager.users.marcus.imports = [ ./home/home.nix ];

  boot.loader = {
    timeout = null;
    grub.useOSProber = true;
  };
}