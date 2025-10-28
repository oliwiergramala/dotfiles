{ config, pkgs, inputs, ... }:
{
	programs.home-manager.enable = true;
 
	home.username = "oliwier";
	home.homeDirectory = "/home/oliwier";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
				jetbrains.rider
    		kdePackages.kate
    		vscode
    		discord
    		yt-dlp
    		moc
    		logseq
    		megasync
    		flatpak
    		steam
				neofetch
  	];

  	home.file = {
 	
	};
	
	programs.neovim = {
  		enable = true;
  		viAlias = true;
  		vimAlias = true;
  		withNodeJs = true;

  		plugins = with pkgs.vimPlugins; [
    			nvim-tree-lua
    			vim-startify

  		];

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
