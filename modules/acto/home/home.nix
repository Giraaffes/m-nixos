{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
  ];

  home.stateVersion = "25.11";
}
