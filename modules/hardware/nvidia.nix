{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    #enable32bit=true;
  };
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true; # changed from false
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
