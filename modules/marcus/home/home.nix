{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Minecraft
    prismlauncher
  ];

  home.stateVersion = "25.11";
}
