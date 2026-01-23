{ config, pkgs, inputs, ... }:
{
	programs.home-manager.enable = true;
 
	home.username = "oliwier";
	home.homeDirectory = "/home/oliwier";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
	
		# IDE/TextEditor
    		vscode
		jetbrains.rider

		# Games
		steam
		heroic
		wineWowPackages.stable
		
		# Socials
		signal-desktop
		discord

		# Music
		yt-dlp
		moc

		# Other
  		logseq
		neofetch
	    	megasync
    		flatpak
    		kdePackages.kate
		dosbox
		keepassxc
		qemu
		# LaTeX
		texliveFull
		zathura
		
		# 3D model
		freecad-wayland
	
		# Git
		gitnuro

		dotnet-sdk_9
	];

  	home.file = {
	};

	 programs.neovim = {
    		enable = true;
	};

	programs.git = {
    		enable = true;
    		userName = "oliwiergramala";
    		userEmail = "olivier.gramala@gmail.com";
  	};

	programs.firefox = {
		enable = true;
	};
}
