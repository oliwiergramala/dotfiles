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
		
		# Socials
		signal-desktop
		discord

		# Music
		rmpc
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
	];

  	home.file = {
 		
	};
	
 	services.mpd = {
  		enable = true;
  		musicDirectory = "~/Music";
  		network.listenAddress = "localhost";
	  	extraConfig = ''
    			audio_output {
      				type "pulse"
      				name "PulseAudio"
    			}
  		'';
	};

	 programs.neovim = {
    		enable = true;
    		plugins = with pkgs.vimPlugins; [
      			lazy-nvim
    		];

    		extraLuaConfig = ''
      			
			vim.g.nvchad_theme = "catppuccin"
			vim.g.nvchad_transparency = true

			require("lazy").setup({
				{ "nvim-lua/plenary.nvim" },
  				{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
  				{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  				{ "neovim/nvim-lspconfig" },
  				{ "siduck76/NvChad" },
			})

      			vim.o.number = true
      			vim.o.relativenumber = true
    		'';
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
