{ config, pkgs, inputs, ...}:
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    ./hardware-configuration.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 fonts.packages = with pkgs; [
	nerd-fonts.hack
 ];

 fonts.fontconfig.enable = true;

 programs.hyprland.enable = true;
  # SSD
fileSystems."/home/oliwier/SSD" = {
  device = "UUID=1c378180-a70e-4e90-ac4a-33fffef11478";
  fsType = "ext4";     
  options = [ "defaults" "noatime" ];
};

# HDD
fileSystems."/home/oliwier/HDD" = {
  device = "UUID=7d3b47c1-7d0e-4a4a-bfcc-d51f5f01122d";
  fsType = "ext4";
  options = [ "defaults" "noatime" ];
};

  networking.hostName = "nixos"; # Define your hostname.
nixpkgs.config.permittedInsecurePackages = [
                "electron-36.9.5"
		"ventoy-1.1.05"
              ];

  # Enable networking
  networking.networkmanager.enable = true;
  
  networking.firewall = {
	enable = true;
  };
  # SSH
  services.openssh.enable = true;

  # Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl = {
  	enable = true;
	  driSupport32Bit = true;
  };
  
  hardware.nvidia = {
	modesetting.enable = true;
	powerManagement.enable = false;
	open = false;
	nvidiaSettings = true;
	package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.blacklistedKernelModules = [ "nouveau" ];

  services.xserver.displayManager.gdm.wayland = false;
  
  # Docker
  virtualisation.docker = {
    enable = true;
  };  
 
  # Bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "legacy";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oliwier = {
    isNormalUser = true;
    description = "Oliwier";
    extraGroups = ["networkmanager" "wheel" "dialout"];
  };

  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  services.flatpak.enable = true; 
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim    
    wget
    kitty
    kdePackages.discover
    home-manager
    wl-clipboard
    wofi 
    nwg-look
    waybar
    hyprland
];
  
  # Bash 
  programs.bash = {
  	promptInit = ''
    	parse_git_branch() {
      	git rev-parse --abbrev-ref HEAD 2>/dev/null
    	}

    	CYAN="\[\033[1;36m\]"
    	BLUE="\[\033[0;34m\]"
    	RED="\[\033[0;31m\]"    
    	RESET="\[\033[0m\]"

    	PS1="$CYAN[\u@\h]$RESET $BLUE\w$RESET :$RED \$(parse_git_branch)$RESET \\$ "

    	neofetch
  	'';
  };

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
  system.stateVersion = "25.05"; # Did you read the comment?
}
