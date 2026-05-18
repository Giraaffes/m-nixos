{ ... }:
{
  home-manager.users.marcus.imports = [ ./home/home.nix ];
  
  services.tailscale.enable = true;
  services.tinyproxy = {
    enable = true;
    settings = {
      Port = 8888;
      Listen = "0.0.0.0";
      Allow = [ "127.0.0.1" "100.64.0.0/10" ];
    };
  };
}