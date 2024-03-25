# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nicksnix"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";
  services.ntp.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
  
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    fish.enable = true;
};

virtualisation.docker.enable = true;

environment.variables = {
	SUDO_EDITOR = "nvim";
	SYSTEMD_EDITOR = "nvim";
	EDITOR = "nvim";
	VISUAL = "nvim";
};

  users.users.nicklausb = {
    isNormalUser = true;
    description = "Nicklaus Badyal";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      
      #Applications
      discord
      firefox
      spotify
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    starship
    kitty
    git
    neofetch
    clang
    vscode.fhs
  ];

  programs.starship = {
    enable = true;
    settings = {
	add_newline = false;
    	format = "[[░▒▓](#C5727A)[ 󱄅 ](bg:#C5727A fg:#FFFFFF)$username[](bg:#BE9DB8 fg:#C5727A)$directory[](bg:#81A1C1 fg:#BE9DB8)$git_branch$git_status[](bg:#EFD49F fg:#81A1C1)$rust$nodejs[](bg:#B1C89D fg:#EFD49F)$time[](fg:#B1C89D)\n$character](white)";
	character = {
	  success_symbol = "[󰘍 ](#C5727A)";
	  error_symbol = "[󰘍 ](#EFD49F)";
	};
	username = {
	  show_always = true;
	  style_user = "bg:#C5727A fg:#FFFFFF";
	  style_root = "bg:#C5727A fg:#FFFFFF";
	  format = "[ $user ]($style)";
	};
	directory = {
	  home_symbol = "󰋞 ";
    	  format = "[ $path ](bg:#BE9DB8 fg:#FFFFFF)";
	};
	git_branch = {
	  symbol = "  ";
	  style = "bg:#81A1C1";
	  format = "[[ $symbol $branch ](fg:#FFFFFF bg:#81A1C1)]($style)";
	};
	git_status = {
	  style = "bg:#81A1C1";
	  format = "[[ $all_status $ahead_behind ](fg:#FFFFFF bg:#81A1C1)]($style)";
	};
	rust = {
	  symbol = "  ";
	  style = "bg:#EFD49F";
	  format = "[[ $symbol ($version) ](fg:#FFFFFF bg:#EFD49F)]($style)";
	};
	nodejs = {
	  symbol = "  ";
	  style = "bg:#EFD49F";
	  format = "[[ $symbol ($version) ](fg:#FFFFFF bg:#EFD49F)]($style)";
	};
	time = {
	  disabled = false;
	  time_format = "%R";
	  style = "bg:#B1C89D fg:#ffffff";
	  format = "[  $time ]($style)";
	};
	directory.substitutions = {
	};
    };
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];
  
  system.stateVersion = "23.11"; 

}
