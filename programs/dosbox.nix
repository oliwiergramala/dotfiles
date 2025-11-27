{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    dosbox
  ];

  home.activation.makeDosboxDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ${config.home.homeDirectory}/dosbox
  '';  
}
