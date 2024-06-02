{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

  # Hostname
  networking.hostName = "nicksnix"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";
  services.ntp.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  
  # graphics drivers / HW accel
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    videoDrivers = ["nvidia"];
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # For nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  

  users.users.nicklausb = {
    isNormalUser = true;
    description = "Nicklaus Badyal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
      #Applications
      discord
      firefox
      spotify
      obs-studio
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Mandatory packages for nicksnix
  environment.systemPackages = with pkgs; [
    kitty
    git
    gh
  ];


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  
  system.stateVersion = "23.11"; 

}
