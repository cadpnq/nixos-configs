{ config, pkgs, lib, self, ... }:
{ 
  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "23.11";

    packages = with pkgs; [
      vscode
      google-chrome
      discord
      firefox
      git
      github-desktop
      spotify
    ];

    file = {};
    sessionVariables = {};
  };
}
