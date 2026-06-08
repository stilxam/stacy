{ pkgs, ... }:
{
  users.users.maxwell = {
    isNormalUser = true;
    description = "maxwell";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
