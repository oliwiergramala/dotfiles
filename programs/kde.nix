{ config, pkgs, ... }:

{
	home.packages = with pkgs;[
		kdePackages.kate
		kdePackages.kcalc
	];
}
