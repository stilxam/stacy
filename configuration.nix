# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./cachix.nix
      ./modules/packages.nix
      ./modules/programs/hyprland.nix
      ./modules/programs/zsh.nix
      ./modules/programs/steam.nix
      ./modules/services/bluetooth.nix
      ./modules/services/desktop.nix
      ./modules/services/greetd.nix
      ./modules/services/ollama.nix
      ./modules/services/pipewire.nix
      ./modules/services/ssh.nix
      ./modules/hardware/nvidia.nix
      ./modules/system/bootloader.nix
      ./modules/system/networking.nix
      ./modules/system/locale.nix
      ./modules/system/users.nix
    ];


  services = {
    printing.enable = true;
    tailscale.enable = true;
  };

  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment = {
    variables.EDITOR = "neovim";
    sessionVariables = {
      WLR_NO_HARDWARECURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  fonts.packages = [ pkgs.nerd-fonts.zed-mono ];

  nix.settings = {
    substituters = [ "https://nix-community.cachix.org" ];
    trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
    experimental-features = ["nix-command" "flakes" ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  nix.gc = {
    automatic = false;
    dates = "weekly";
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
