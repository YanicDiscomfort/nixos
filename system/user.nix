{ config, lib, pkgs, ... }:

{
  users.users.yanic = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      git
      yazi
      neovim
    ];
  };
}