{ config, pkgs, ... }: {
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Copenhagen";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";
  
  services.dockerRegistry = {
    enable = true;
    listenAddress = "127.0.0.1";
    port = 5000;
    enableDelete = true; 
  };
  virtualisation.oci-containers.containers.watchtower = {
    image = "nickfedor/watchtower";
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
    ];
    cmd = [
      "--interval" "60"
      "--cleanup"
      "--include-restarting"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/m-notifications-storage 0755 1000 1000 -"
  ];
  virtualisation.oci-containers.containers.m-notifications = {
    image = "localhost:5000/m-notifications:latest";
    environment = {
      STORAGE_PATH = "/home/node/app/storage";
      PROXY_URL = "http://100.91.112.112:8888";
      NODE_ENV = "production";
    };
    volumes = [
      "/var/lib/m-notifications-storage:/home/node/app/storage"
    ];
  };

  services.tailscale.enable = true;

  system.stateVersion = "26.05";
}
