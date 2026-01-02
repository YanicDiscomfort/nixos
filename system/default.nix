{ config, lib, pkgs, inputs, ... }:

{
  # ---------------------------------
  # Imports
  # ---------------------------------
  imports =
    [
      ../hardware-configuration.nix
      ./service.nix
      ./user.nix
      inputs.home-manager.nixosModules.default
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
    keyMap = "en";
  };

  # ---------------------------------
  # Nix
  # ---------------------------------
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
