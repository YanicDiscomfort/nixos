{ config, lib, pkgs, ... }:

{
  # ---------------------------------
  # Imports
  # ---------------------------------
  imports =
    [
      ../hardware-configuration.nix
      ./service.nix
      ./user.nix
    ];

  # ---------------------------------
  # Boot / Kernel
  # ---------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # ---------------------------------
  # Network
  # ---------------------------------
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # ---------------------------------
  # Locale / Time
  # ---------------------------------
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  # ---------------------------------
  # Nix
  # ---------------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
