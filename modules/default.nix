{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
