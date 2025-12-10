{ config, pkgs, ... }:

{
	imports = [
		../programs/kde.nix	
	];

	home.packages = with pkgs;[
		neofetch
	];
}
