{ pkgs, flakePath, configName, ... }:
pkgs.writeShellApplication {
  name = "rebuild";
  text = ''
    DO_LOGOUT=false
    DO_REBOOT=false
    
    for arg in "$@"; do
      case "$arg" in
        "--logout")
          DO_LOGOUT=true
          ;;
        "--reboot")
          DO_REBOOT=true
          ;;
      esac
    done

    echo "Stopping plasmashell..."
    systemctl --user stop plasma-plasmashell.service

    if sudo nixos-rebuild switch --flake "${flakePath}#${configName}"; then
      if [[ "$DO_LOGOUT" == "true" ]]; then
        echo "Starting plasmashell..."
        systemctl --user start plasma-plasmashell.service
        echo "Logging out..."
        qdbus org.kde.Shutdown /Shutdown logout
      elif [[ "$DO_REBOOT" == "true" ]]; then
        echo "Rebooting..."
        systemctl reboot
      else
        echo "Starting plasmashell..."
        systemctl --user start plasma-plasmashell.service
      fi
    else
      echo "Build failed! Starting plasmashell..."
      systemctl --user start plasma-plasmashell.service
      exit 1
    fi
  '';
}