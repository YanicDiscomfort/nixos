{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
}