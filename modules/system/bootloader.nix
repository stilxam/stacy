{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-f1605489-1200-4af3-a562-3e07381ed3b5".device = "/dev/disk/by-uuid/f1605489-1200-4af3-a562-3e07381ed3b5";
}
