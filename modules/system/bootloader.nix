{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Replace with your LUKS partition UUID (find it with: lsblk -f)
  boot.initrd.luks.devices."luks-YOUR-UUID".device = "/dev/disk/by-uuid/YOUR-UUID";
}
