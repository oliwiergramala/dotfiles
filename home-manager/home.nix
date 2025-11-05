{ config, pkgs, inputs, ... }:
{
	programs.home-manager.enable = true;
 
	home.username = "oliwier";
	home.homeDirectory = "/home/oliwier";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		
		# Git
		gitnuro

		# IDE/TextEditor
    		vscode
		jetbrains.rider

		# Games
		steam
		
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

		# Documents
		zathura
		texliveFull

		# Dosbox
		wine
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
