{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    
    config = {
      input = {
        "*" = {
          xkb_layout = "de";
	};
      };
      modifier = "Mod4";
      terminal = "kitty";
    };
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
