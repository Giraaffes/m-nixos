{ ... }:
{
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd"; # zstd compresses better, lz4 is faster
  };

  home-manager.users.marcus.imports = [ ./home/home.nix ];
}