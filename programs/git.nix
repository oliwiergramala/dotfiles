{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "oliwiergramala";
    userEmail = "olivier.gramala@gmail.com";
  };

  home.packages = with pkgs; [
    gitnuro
  ];
}
