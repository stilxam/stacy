{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
      # ---------------------
    # --- Development Tools
    # ---------------------
    cargo
    git
    gh
    jetbrains-toolbox
    nodejs
    nix-output-monitor
    nix-prefetch-git
    python313
    sqlite
    zed-editor

    # ---------------------
    # --- System Utilities
    # ---------------------
    btop
    gnome-disk-utility
    grc
    neofetch
    nix-output-monitor
    pavucontrol
    ripgrep
    tailscale
    tmux
    unzip
    wget
    wl-clipboard
    zip

    # ---------------------
    # --- Desktop Environment & Utilities (Hyprland/Sway)
    # ---------------------
    dunst
    greetd.tuigreet
    hyprcursor
    hyprpaper
    hyprshot
    hyprsunset
    networkmanagerapplet
    picom
    rofi
    swaylock
    waybar

    # ---------------------
    # --- Web Browsers
    # ---------------------
    chromium
    google-chrome
    librewolf
    w3m

    # ---------------------
    # --- Productivity & Creativity
    # ---------------------
    blender
    gimp
    libreoffice
    ranger
    kdePackages.dolphin
    thunderbird
    vim
    vlc

    # ---------------------
    # --- Communication & Entertainment
    # ---------------------
    spotify
    steam
    teams-for-linux
    threema-desktop

    # ---------------------
    # --- AI & Machine Learning
    # ---------------------
    ollama
    nextjs-ollama-llm-ui

    # ---------------------
    # --- Miscellaneous
    # ---------------------
    eduvpn-client
    fzf
    gnupg
    shotman
    thefuck
  ];
}
