{ config, pkgs, ... }:
{
  imports = [
    ../programs/libreoffice.nix
    ../programs/latex.nix
    ../programs/dosbox.nix
    ../programs/scilab.nix
  ];
}
