{ config, pkgs, ... }:

{
	programs.direnv = {
		enable = true;
		nix-direnv.enable = true;
	};

	environment.systemPackages = [
		pkgs.direnv
		pkgs.nix-direnv
	];
}
