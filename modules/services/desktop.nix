{
  services.desktopManager.plasma6.enable = true;
  services.xserver = {
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "ovindar";
  };
}
