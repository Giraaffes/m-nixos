{ pkgs, resolve, ... }:
let
  segoeFont = import (resolve "pkgs/segoe-font.nix") {
    inherit pkgs;
    name = "segoe-ui-font";
    fontPath = resolve "resources/segoe/";
  };
  #aeroCursor = import (resolve "pkgs/aero-cursor.nix") {
  #  inherit pkgs;
  #  name = "aero-cursor";
  #  cursorName = "Aero";
  #  cursorPath = resolve "resources/aero/";
  #};
in
{
  home.packages = [
    pkgs.nur.repos.shadowrz.klassy-qt6
    segoeFont
    #aeroCursor
  ];

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
  };
  # It will complain if we don't force override this file
  xdg.configFile."fontconfig/conf.d/10-hm-fonts.conf".force = true;

  programs.plasma.enable = true;

  programs.plasma.workspace = {
    colorScheme = "KlassyLight";
    theme = "breeze-dark";
    windowDecorations.library = "org.kde.klassy";
    windowDecorations.theme = "Klassy";
    wallpaper = resolve "resources/wallpaper-sequoia.png";
    cursor = {
      #theme = "Aero";
      #size = 32;
      theme = "Breeze_Light";
      size = 24;
      cursorFeedback = "None";
    };
  };

  programs.plasma.fonts = {
    general = {
      family = "Segoe UI";
      pointSize = 10;
    };
    small = {
      family = "Segoe UI";
      pointSize = 8;
    };
    toolbar = {
      family = "Segoe UI";
      pointSize = 10;
    };
    menu = {
      family = "Segoe UI";
      pointSize = 10;
    };
    windowTitle = {
      family = "Segoe UI";
      pointSize = 10;
    };
  };

  programs.plasma.kwin = {
    effects.shakeCursor.enable = false;
  };
  programs.plasma.configFile."kwinrc" = {
    "TabBox" = {
      "DelayTime" = 0;
      "HighlightWindows" = false;
    };
    # Disables top left corner action
    "Effect-overview" = {
      "BorderActivate" = 9;
    };
  };

  programs.plasma.configFile."kdeglobals" = {
    "KDE" = {
      "AnimationDurationFactor" = 0.5;
      "DndBehavior" = "MoveIfSameDevice";
    };
    #"General" = {
    #  "XftAntialias" = true;
    #  "XftHintStyle" = "hintslight";
    #  "XftSubPixel" = "rgb";
    #};
  };

  programs.plasma.powerdevil.AC = {
    autoSuspend.action = "nothing";
    dimDisplay.enable = false;
    turnOffDisplay.idleTimeout = "never";
    whenLaptopLidClosed = "doNothing";
    powerProfile = "performance";
  };

  programs.plasma.kscreenlocker = {
    autoLock = false;
  };

  programs.plasma.session = {
    general.askForConfirmationOnLogout = false;
  };

  programs.plasma.panels = [
    {
      location = "bottom";
      floating = false;

      widgets = [
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General = {
              icon = "plasma-symbolic";
              highlightNewlyInstalledApps = false;
              primaryActions = 3;
              showActionButtonCaptions = false;
              systemFavorites = "lock-screen\\,logout\\,switch-user\\,suspend\\,reboot\\,shutdown";
            };
          };
        }
        {
          iconTasks = {
            launchers = [
              "applications:systemsettings.desktop"
              "applications:org.kde.plasma-systemmonitor.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:org.kde.konsole.desktop"
              "applications:firefox.desktop"
              "applications:code.desktop"
            ];
          };
        }
        "org.kde.plasma.marginsseparator"
        {
          systemTray = {
            items = {
              # Extra apparently just means all that are enabled
              extra = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.notifications"
                "org.kde.plasma.battery"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.brightness"
                "org.kde.plasma.devicenotifier"
                "org.kde.kscreen"
                # Shown when relevant:
                "org.kde.plasma.cameraindicator"
              ];
              shown = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.battery"
              ];
              hidden = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.brightness"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.notifications"
                "org.kde.kscreen"
              ];
            };
          };
        }
        {
          digitalClock = {
            time.format = "24h";
            date = {
              enable = true;
              format = {
                custom = "d/M/yyyy";
              };
            };
            calendar = {
              firstDayOfWeek = "monday";
              showWeekNumbers = true;
            };
          };
        }
        "org.kde.plasma.minimizeall"
      ];
    }
  ];
}
