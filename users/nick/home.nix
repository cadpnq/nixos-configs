{ config, pkgs, lib, self, ... }:
{ 
  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "23.11";

    packages = with pkgs; [
#      vscode
      google-chrome
      discord
      firefox
      git
      github-desktop
      spotify
      wezterm
    ];

    file = {};
    sessionVariables = {};
  };

  programs.home-manager.enable = true;

  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
    ];
  };
}
