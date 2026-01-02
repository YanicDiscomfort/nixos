{ config, libs, pkgs, ... }:

{
  imports = [ ../../system ];

  # XFCE Desktop Environment Configuration
  services.xserver = {
    enable = true;
    
    # Desktop Manager
    desktopManager.xfce = {
      enable = true;
      enableXfwm = true;
      enableScreensaver = false;
    };
    
    # Display Manager
    displayManager = {
      lightdm.enable = true;
      defaultSession = "xfce";
    };
  };

  # Enable dbus (required for XFCE)
  services.dbus.enable = true;

  # Enable polkit (required for system authentication dialogs)
  security.polkit.enable = true;

  # XFCE-related packages
  environment.systemPackages = with pkgs; [
    # XFCE applications
    xfce.xfce4-taskmanager
    xfce.xfce4-power-manager
    xfce.xfce4-settings
    xfce.xfce4-screenshooter
    xfce.xfce4-terminal
    xfce.xfce4-notifyd
    xfce.xfce4-volumed-pulse
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-clipman-plugin
    xfce.xfce4-systemload-plugin
    
    # File management
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    
    # Media and utilities
    vlc
    firefox
    vesktop

    # Archives
    file-roller
    p7zip
    unzip
    unrar-free
    
    # System utilities
    networkmanagerapplet
  ];

  # Thumbnail support for Thunar
  services.tumbler.enable = true;

  # Enable GVFS for Thunar
  services.gvfs.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dejavu_fonts
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}

