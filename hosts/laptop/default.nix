{ config, pkgs, ... }:

{
  imports = [ ../../system ];

  services.xserver.xkb.layout = "de";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Login manager: lydm
  services.displayManager.ly = {
    enable = true;
    settings = {
      default_session = "sway";
    };
  };
  services.xserver.displayManager.defaultSession = "sway";

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      swaybg
      swaylock
      swayidle
      grim
      slurp
      wl-clipboard
      waybar
      wofi
      mako
      kitty
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    fira-code
  ];
}

