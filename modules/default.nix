{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
