# Test
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    sha256 = "08h8rs4di9ln5c6hyvhc04wj6y24gmv4q5bp9qq052kmw5a1r9x0";
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];

  # NixOS Version
  system.stateVersion = "25.05";

  # Config Home Manager
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.icdt = {
    imports = [
      ./home.nix
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define your hostname.
  networking.hostName = "nix-top"; # Define your hostname.

  # Kernel Config
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  boot.kernelParams = [ "preempt=full" ];
  #boot.kernelPatches = lib.mkForce [
  #  {
  #      name = "enable RT_FULL";
  #      patch = null;
  #      extraStructuredConfig.PREEMPT = lib.mkForce lib.kernel.yes;
  #  }
  #];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable all firmware
  hardware.enableAllFirmware = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.icdt = {
    isNormalUser = true;
    description = "Iced Tea";
    extraGroups = [ "networkmanager" "wheel" "audio" "root" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [

    # System
    npins
    blueman
    bluez
    sony-headphones-client
    ldacbt
    git
    ripgrep
    pipewire
    pulseaudioFull
    pavucontrol
    rtkit
    wireplumber
    libopus
    alsa-utils
    fwupd
    sony-headphones-client
    xorg.xbacklight
    lact
    usbutils
    gnumake
    openssh

    # Editors
    vim
    emacs
    emacsPackages.gtk-variant

    # Terminal
    kitty
    git
    fastfetch
    wget
    htop
    cmatrix
    pipes
    zsh
    oh-my-zsh
    python313Packages.image-go-nord
    astroterm
    findutils
    fd
    cava
    xclip
    wl-clipboard
    unzip
    unrar
    killall
    nixpkgs-fmt
    eza
    lf
    mc
    lshw
    ueberzug
    chafa
    pistol
    gh

    # Desktop Environment
    hyprland
    waybar
    hyprpaper
    rofi
    home-manager
    hyprcursor
    bibata-cursors
    catppuccin
    gtk2
    libsForQt5.full
    hyprshot
    pyprland
    # quickshell.packages.${pkgs.system}.default
    exiftool

    # Web
    firefox

    # Video Games
    steam
    parsec-bin
    ryujinx
    lutris

    # Other Applications
    pkgs.libsForQt5.dolphin
    orca-c
    rawtherapee
    vlc
    imagemagick
    poppler
    epub-thumbnailer
    wkhtmltopdf
    file
    p7zip
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.iosevka
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Fira Code NF" ];
        sansSerif = [ "Fira Code NF" ];
        monospace = [ "Iosevka NF" ];
      };
    };
  };

  # Enable Hyprland
  programs.hyprland.enable = true;


  # Enable Waybar
  programs.waybar.enable = true;

  # Enable SDDM Login
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  # Set ZSH as default
  programs.zsh.enable = true;
  users.extraUsers.icdt = {
    shell = pkgs.zsh;
  };
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "af-magic";

  # Setup Bluetooth
hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true; # Might be needed for some newer features/codecs
    };
  };
};

  # Audio
  xdg.portal.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    #jack.enable = true;

      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.rate" = 192000;
            "default.clock.quantum" = 4096;
            "default.clock.min-quantum" = 2048;
            "default.clock.max-quantum" = 8192;

          };
        };
        "90-custom-settings.conf" = {
          context.properties = {
            log.level = 3;
          };
        };
      };
  };

  # Firmware upgrading
  services.fwupd.enable = true;

  # dGPU control
  services.lact.enable = true;

  # musnix
  musnix = {
    enable = true;
    soundcardPciId = "00:1f.3";

    alsaSeq.enable = false;
    # kernel.optimize = true;
    kernel.realtime = true;

    # rtirq.highList = "snd_hrtimer";
    rtirq.resetAll = 1;
    rtirq.prioLow = 0;
    rtirq.enable = true;
    rtirq.nameList = "rtc0 snd";
    das_watchdog.enable = true;
  };

  # Set Emacs as default system editor
  environment.variables = {
    EDITOR = "emacsclient -c -a \"\" -t";
    VISUAL = "emacsclient -c -a \"\" -t";
  };

  # Enable support for usb drives (Why is this not already a thing)
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;

  # SSH Support
  programs.ssh.startAgent = true;
  services.openssh.enable = true;
}
