{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = config.programs.git.userName;
    userEmail = config.programs.git.userEmail;
  };
}
