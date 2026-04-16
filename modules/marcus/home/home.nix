{ pkgs, ... }:
{
  xdg.configFile."baloofilerc" = {
    text = ''
      [Basic Settings]
      Indexing-Enabled=false
    '';
    force = true;
  };

  home.packages = with pkgs; [
    # Minecraft
    prismlauncher
  ];

  home.stateVersion = "25.11";
}
