{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    
    extraConfig = ''
      input * {
        xkb_layout "de"
      }
    '';
    config.terminal = "kitty";
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
    };
  };
}
