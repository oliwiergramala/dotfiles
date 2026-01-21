{ config, pkgs, ... }:

{

	imports= [
		../programs/nvim.nix
	];

	home.packages = with pkgs; [
		logseq
		wine
		keepassxc
		firefox
		xorg.xhost
];
}
