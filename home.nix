{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-manager/packages.nix
    ./home-manager/common/git.nix
    ./home-manager/common/kitty.nix
    ./home-manager/nixvim/default.nix
  ];


  home.username = "maxwell";
  home.homeDirectory = "/home/maxwell";
  home.stateVersion = "25.05";

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
