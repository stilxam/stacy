{ pkgs, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs; [
    #(callPackage ./programs/min.nix {})
    # zoom-us
      # ---------------------
    # --- Development Tools
    # ---------------------
    cargo
    git
    gh
    nix-output-monitor
    nix-prefetch-git
    python313
    jetbrains-toolbox
    pkgs-unstable.claude-code
    # ---------------------
    # --- System Utilities
    # ---------------------
    btop
    gnome-disk-utility
    grc
    nix-output-monitor
    pavucontrol
    ripgrep
    tailscale
    tmux
    unzip
    wget
    wl-clipboard
    zip
    imgcat
    pay-respects
    

    # ---------------------
    # --- Desktop Environment & Utilities 
    # ---------------------
    sunsetr
    swaybg
    fuzzel
    xwayland-satellite
    nautilus
    dunst
    tuigreet
    networkmanagerapplet
    picom
    swaylock
    waybar

    # ---------------------
    # --- Web Browsers
    # ---------------------
    google-chrome
    firefox

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
    # spotify
    # steam
    # teams-for-linux
    # threema-desktop

    # ---------------------
    # --- AI & Machine Learning
    # ---------------------
    # pkgs-unstable.ollama[-cuda]
    nextjs-ollama-llm-ui

    # ---------------------
    # --- Miscellaneous
    # ---------------------
    eduvpn-client
    fzf
    gnupg
    shotman
    shotcut
  ];
}
