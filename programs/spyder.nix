{ config, pkgs, ... }:

let
  myPython = pkgs.python313.withPackages (ps: with ps; [
    spyder
    spyder-kernels
	]);
in {
  home.packages = [
    myPython
  ];
}
