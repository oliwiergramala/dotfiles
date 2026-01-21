{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		
		# POSTRGRES
		pgadmin4
		postgresql
	
		# SQLITE
		sqlite
		sqlitebrowser
	];
}
