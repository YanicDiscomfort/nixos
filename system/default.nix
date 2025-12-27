{ config, lib, pkgs, ... }:

let
  # ---------------------------------
  # Benutzerdefinierte Pakete
  # ---------------------------------
  systemPackages = with pkgs; [
    neovim
    wget
  ];
in

{
  # ---------------------------------
  # Imports
  # ---------------------------------
  imports =
    [
      ../hardware-configuration.nix
      ./user.nix
    ];

  # ---------------------------------
  # Boot / Kernel
  # ---------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # ---------------------------------
  # Netzwerk
  # ---------------------------------
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # ---------------------------------
  # Locale / Zeit
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

  # ---------------------------------
  # Services
  # ---------------------------------
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # ---------------------------------
  # Systempakete & Programme
  # ---------------------------------
  environment.systemPackages = systemPackages;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  # ---------------------------------
  # System-Kompatibilität
  # ---------------------------------
  system.stateVersion = "25.11";
}
