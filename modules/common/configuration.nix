{ pkgs, hostName, resolve, pkgsUnstable, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    systemd-boot.enable = false;
    grub.enable = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-qt5-1.1.10"
  ];

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
    elisa
    okular
    kwalletmanager
    plasma-browser-integration
  ];

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "dk";
  console.useXkbConfig = true;

  networking.networkmanager.enable = true;
  services.usbmuxd.enable = true;

  virtualisation.docker.enable = true;

  # For React Native DevTools
  # List taken from https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/appimage/default.nix
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    gtk3
    bashInteractive
    zenity
    xrandr
    which
    perl
    xdg-user-dirs
    xdg-utils
    iana-etc
    krb5
    gsettings-desktop-schemas
    hicolor-icon-theme
    desktop-file-utils
    libxcomposite
    libxtst
    libxrandr
    libxext
    libx11
    libxfixes
    libGL

    gst_all_1.gstreamer
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-base
    libdrm
    xkeyboard-config
    libpciaccess

    glib
    bzip2
    zlib
    gdk-pixbuf

    libxinerama
    libxdamage
    libxcursor
    libxrender
    libxscrnsaver
    libxxf86vm
    libxi
    libsm
    libice
    freetype
    curlWithGnuTls
    nspr
    nss
    fontconfig
    cairo
    pango
    expat
    dbus
    cups
    libcap
    SDL2
    libusb1
    udev
    dbus-glib
    atk
    at-spi2-atk
    libudev0-shim

    libxt
    libxmu
    libxcb
    libxcb-util
    libxcb-wm
    libxcb-image
    libxcb-keysyms
    libxcb-render-util
    libGLU
    libuuid
    libogg
    libvorbis
    SDL2_image
    openssl
    libidn
    onetbb
    wayland
    libgbm
    libxkbcommon
    vulkan-loader

    flac
    libglut
    libjpeg
    libpng12
    libpulseaudio
    libsamplerate
    libmikmod
    libthai
    libtheora
    libtiff
    pixman
    speex
    SDL2_ttf
    SDL2_mixer
    libcaca
    libcanberra
    libgcrypt
    libvpx
    librsvg
    libxft
    libvdpau
    alsa-lib

    harfbuzz
    e2fsprogs
    libgpg-error
    keyutils.lib
    libjack2
    fribidi
    p11-kit

    gmp
  ];

  users.users.marcus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.bash;
  };
  nix.settings.trusted-users = [ "root" "marcus" ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit hostName; inherit resolve; inherit pkgsUnstable; };
  home-manager.users.marcus = {
    imports = [ ./home/home.nix ];
  };

  system.stateVersion = "26.05";
}

