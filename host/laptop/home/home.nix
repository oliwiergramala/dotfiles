{ config, pkgs, inputs, ... }:
{
	programs.home-manager.enable = true;
 
	home.username = "oliwier";
	home.homeDirectory = "/home/oliwier";

	home.stateVersion = "25.05";
	imports = [ 
		../../../modules/university.nix
		../../../modules/develop.nix
		../../../modules/utilities.nix
		../../../modules/social.nix
		../../../modules/base.nix
	];
	home.packages = with pkgs; [
		# Games
		steam
    		megasync
    		flatpak
	];	
}
