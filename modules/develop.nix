{ config, pkgs, ... }:
{
  imports = [
    ../programs/git.nix
    ../programs/docker.nix
    ../programs/direnv.nix
    ../programs/database.nix
    ../programs/ide.nix
    ../programs/qemu.nix
  ];

}

