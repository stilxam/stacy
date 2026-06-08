{
  services.desktopManager.plasma6.enable = false;
  services.displayManager.sddm.enable= true;

  services.xserver = {
    enable=true;
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "maxwell";
  };
}
