{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.5";
      confirm_os_window_close = 0;
    };
  };
}
