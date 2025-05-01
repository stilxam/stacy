#
# Edit this configuration file to define what should be installed on 
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
{
  # Import the auto-generated hardware configuration.
  imports =
    [
      ./hardware-configuration.nix
    ];

  #############################################
  # Bootloader & Firmware Settings
  #############################################
  # Enable systemd-boot as the bootloader and allow modifying EFI variables.

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #############################################
  # Networking Configuration
  #############################################
  # Set your system hostname.
  networking.hostName = "stacy"; 

  # Enable NetworkManager for handling networking (cable and wireless).
  networking.networkmanager.enable = true;
  
  # Uncomment to enable wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Proxy settings: Uncomment and set if you use a network proxy.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";
  

  #############################################
  # Time and Internationalisation
  #############################################

  # Set internationalisation and locale properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_CH.UTF-8";
      LC_IDENTIFICATION = "fr_CH.UTF-8";
      LC_MEASUREMENT = "fr_CH.UTF-8";
      LC_MONETARY = "fr_CH.UTF-8";
      LC_NAME = "fr_CH.UTF-8";
      LC_NUMERIC = "fr_CH.UTF-8";
      LC_PAPER = "fr_CH.UTF-8";
      LC_TELEPHONE = "fr_CH.UTF-8";
      LC_TIME = "fr_CH.UTF-8";
    };
  };

  #############################################
  # Services Configuration
  #############################################
  services = {
    # X server configuration with KDE Plasma and Nvidia drivers.
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      videoDrivers = ["nvidia"];
      xkb = {
        layout= "us"; # Set keyboard layout.
        variant = ""; # Optional keyboard variant.
	};
    };
    # Greetd config: Provides GUI login manager.
    greetd = {
      enable = true;
      settings = {
        default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd Hyprland
      '';
      };
    };

    # Enable printing support.
    printing.enable = true;
    
    # Pipewire config for multimedia, with ALSA and Pulse support.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # Display manager auto-login config (disabled).
    displayManager.autoLogin= {
    enable=false;
    user="ovindar";
    };

    # OpenSSH config.
    openssh.enable = true;
    
    # Tailscale VPN service.
    tailscale.enable = true;
    
    # Flatpak Support.
    flatpak.enable=false;

    # Enable Ollama server with CUDA.
    ollama.enable = true;
    ollama.acceleration = "cuda";

    # Enable Blueman for Bluetooth management.
    blueman.enable=true; 

  };
  security = {
    # Enabling polkit for privilege management.
    polkit.enable = true;
    
    # Enabling RealtimeKit Daemon.
    rtkit.enable = true;
  };


  hardware = {
    # Disable PulseAudio since Pipewire is used.
    pulseaudio.enable = false;

    # Enable graphics support.
    graphics.enable = true;
    graphics.enable32Bit =true;
    # NVIDIA specific config.
    nvidia-container-toolkit.enable=true;
    nvidia = {
      modesetting.enable = true;    # Enable GPU modesetting.
      powerManagement.enable = false;       # Nvidia power management (experimental, disables sleep/suspend issues).
      powerManagement.finegrained = false;    # Fine-grained power management for modern GPUs (experimental).
      open = false;                 # Use proprietary drivers instead of open-source alternatives.
      nvidiaSettings = true;        # Enable the Nvidia settings utility.
      # Choose the appropriate driver package here:
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # Alternatives (uncomment as needed):
      # package = config.boot.kernelPackages.nvidiaPackages.beta;
      # package = config.boot.kernelPackages.nvidiaPackages.production;
      # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
      # package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
      # package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
      # package = config.boot.kernelPackages.nvidiaPackages.legacy_350;

    };
    # Bluetooth config.
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    # Use the full PulsAudio package when needed.
    pulseaudio.package= pkgs.pulseaudioFull;
  };



  #############################################
  # User Accounts
  #############################################
  users.users.ovindar = {
    isNormalUser = true;
    description = "Maxwell";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  programs = {
    nix-ld = {
      enable = true;
      #libraries = with pkgs; [
 #zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2 libxml2 acl libsodium util-linux xz systemd       
 #zlib 
	#zstd 
	#stdenv.cc.cc 
	#curl 
	#openssl 
	#attr 
	#libssh 
	#bzip2 
	#libxml2 
	#acl 
	#libsodium 
	#util-linux 
	#xz 
	#systemd 
	#gcc
        #glibc
        #gcc-unwrapped.lib
        #libffi
	#];
	};
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = {
    systemPackages = with pkgs; 
      [
      # Development Tools
      uv 
      python313
      cargo nodejs sqlite git gh
      
      nix-output-monitor
      nix-prefetch-git

      # System Utilities
      btop zip unzip wget tailscale neofetch tmux
      ripgrep grc fzf wl-clipboard gnome-disk-utility
      
      # Editors & IDEs
      vim neovim zed-editor jetbrains-toolbox bootstrap-studio
      
      # Browsers
      librewolf google-chrome
      
      # Multimedia
      blender gimp libreoffice thunderbird spotify
      
      # Hyprland Ecosystem
      waybar dunst hyprcursor hyprpaper hyprshot
      rofi pavucontrol swww networkmanagerapplet
      greetd.tuigreet kitty 
      
      # CUDA Stack
      cudatoolkit
      linuxPackages.nvidia_x11 
      cudaPackages.cudnn 
      libGLU 
      libGL 
      xorg.libXi 
      xorg.libXmu 
      freeglut 
      xorg.libXext 
      xorg.libX11 
      xorg.libXv 
      xorg.libXrandr 
      zlib 
      ncurses5 
      stdenv.cc 
      binutils

    
    

      # terminal utils 
      zoxide
      oh-my-posh

    

    # productivity
    pomodoro
    todo

    # apps
    ollama
    discord

    
    
    # WM setup

    ## File browsing
    ranger
    dolphin


    picom
    rofi
    pavucontrol
    swww
    networkmanagerapplet


    shotman
    w3m


    gnome-disk-utility
    


    
    

  ];
    variables.EDITOR = "neovim";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
   };
  };


  programs.zsh.enable=true;

  


  # ---------------------
  # FONTS CONFIGURATION
  # ---------------------

  fonts ={
    packages = with pkgs;[
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];
  };
  #fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
  };



  nix.settings.experimental-features = [ "nix-command" "flakes" ];


 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };




  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

}
