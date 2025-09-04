# Stacy's NixOS Configuration

This repository contains the NixOS configuration for a system named "stacy", managed using Nix Flakes.

## File Structure

The repository is organized as follows:

- `flake.nix`: The entry point for the configuration. It defines the inputs (like `nixpkgs`, `home-manager`, etc.) and the main output, which is the NixOS configuration for "stacy".

- `configuration.nix`: The main NixOS configuration file. It imports all the necessary modules from the `modules/` directory and sets system-wide options.

- `home.nix`: The main Home Manager configuration file. It imports user-specific modules from the `home-manager/` directory.

- `modules/`: This directory contains modularized NixOS configurations, categorized into:
    - `hardware/`: Hardware-specific configurations (e.g., NVIDIA drivers, Bluetooth).
    - `programs/`: Configuration for system-wide programs (e.g., Hyprland, Zsh, Steam).
    - `services/`: Configuration for system services (e.g., greetd, PipeWire, SSH).
    - `system/`: Basic system settings (e.g., bootloader, networking, locale, users).
    - `packages.nix`: Defines system-wide packages to be installed.

- `home-manager/`: This directory contains modularized Home Manager configurations, categorized into:
    - `common/`: Common user-specific configurations (e.g., Git, Kitty).
    - `nixvim/`: Configuration for NixVim.
    - `packages.nix`: Defines user-specific packages to be installed.

- `cachix/`: This directory contains configurations for Cachix, a binary cache service for Nix.

## Usage

To apply this configuration to a NixOS system, you can use the following commands:

### New Installation

For a new installation, you can use the `nixos-install` command with the flake:

```bash
nixos-install --flake .#stacy
```

### Existing System

For an existing system, you can switch to the new configuration using `nixos-rebuild`:

```bash
nixos-rebuild switch --flake .#stacy
```

## Secrets

This configuration uses a `secrets.nix` file to store sensitive information, such as usernames, email addresses, and other personal data. This file is not tracked by Git and should be created manually.

To use this configuration, create a `secrets.nix` file in the root of the repository with the following structure:

```nix
{
  users.users.<username> = {
    isNormalUser = true;
    description = "<description>";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  home-manager.users.<username> = {
    imports = [ 
      inputs.nixvim.homeManagerModules.nixvim
      ./home.nix 
    ];
  };

  home = {
    username = "<username>";
    homeDirectory = "/home/<username>";
  };

  programs.git = {
    userName = "<git_username>";
    userEmail = "<git_email>";
  };
}
```

Replace the following placeholders with your own information:

- `<username>`: Your username.
- `<description>`: A description for your user account.
- `<git_username>`: Your Git username.
- `<git_email>`: Your Git email address.

## Customization

To customize this configuration, you can add new modules to the `modules/` or `home-manager/` directories and import them in `configuration.nix` or `home.nix`, respectively. You can also modify the existing files to change the configuration.