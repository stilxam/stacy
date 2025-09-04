{ pkgs, ... }:
{
  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.onedark.enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
    };
    highlight = {
      Comment = {
        fg = "#ff00ff";
        bg = "#000000";
        underline = true;
        bold = true;
      };
    };
    globals.mapleader = " ";
  };
}
