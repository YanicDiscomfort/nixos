{ config, libs, pkgs, ... }:

{
  imports = [ ../../system ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;

    xrdp = {
      defaultWindowManager = "startplasma-wayland";
      enable = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "de";
      };
    };
  };

  environment.systemPackages = with pkgs;
  [
    wayland-utils
    wl-clipboard
    xclip
    firefox 
  ];
}

