{ config, pkgs, ... }:

{
	home.packages = with pkgs;[
		scilab-bin
	];
}
