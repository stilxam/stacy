# stacy — NixOS configuration

Personal NixOS flake for a single machine.

## Hardware

- **CPU:** Intel (x86\_64)
- **GPU:** NVIDIA (open drivers + CUDA)
- **Disk:** LUKS-encrypted

## Features

- **Compositor:** [niri](https://github.com/YaTeresa/niri) (Wayland)
- **Home Manager** for user environment management
- **nixvim** for Neovim configuration
- **Ollama** with CUDA support for local LLMs
- **Zsh** with oh-my-zsh

## Usage

```sh
git clone <this-repo> /etc/nixos
cd /etc/nixos
```

Before applying, you must customize:

1. **Username** — replace `maxwell` in `flake.nix`, `home.nix`, and `modules/system/users.nix`
2. **Hardware** — generate `hardware-configuration.nix` for your machine (it is git-ignored):
   ```sh
   nixos-generate-config --show-hardware-config > hardware-configuration.nix
   ```
   Also update the LUKS UUID placeholder in `modules/system/bootloader.nix`.
3. **Git identity** — set your name and email in `home-manager/common/git.nix`

Then apply:

```sh
sudo nixos-rebuild switch --flake .#stacy
```

## License

MIT
