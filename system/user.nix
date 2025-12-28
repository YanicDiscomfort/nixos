{ config, lib, pkgs, ... }:

{
  users.users.yanic = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      git
      gh
      yazi
      neovim
      zsh
      oh-my-zsh
      vesktop
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
}
