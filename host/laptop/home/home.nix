{ config, pkgs, inputs, ... }:
{
	programs.home-manager.enable = true;
 
	home.username = "oliwier";
	home.homeDirectory = "/home/oliwier";

	home.stateVersion = "25.05";
	imports = [ 
		../../../modules/university.nix
		../../../modules/develop.nix
	];
	home.packages = with pkgs; [
	
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
		keepassxc

		# Documents
		zathura
		texliveFull
		
		wine
	];	

	programs.neovim = {
		enable = true;
  	};

	programs.firefox = {
		enable = true;
	};

	
}
