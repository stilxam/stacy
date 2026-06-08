{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "your-username";
    settings.user.email = "your@email.com";
  };
}
