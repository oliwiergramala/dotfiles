{ config, pkgs, ... }:
{
  imports = [
    ../programs/git.nix
    ../programs/docker.nix
  ];
}
