{
  description = "Nixos config flake";

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./users
        ./hosts
      ];
      
      # perSystem = {pkgs, system, ...}: {
      #   _module.args.pkgs = import nixpkgs {
      #     inherit system;
      #     config.allowUnfree = true;
      #   };
      # };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };
}


  # outputs = inputs@{ nixpkgs, home-manager, ...}: {
  #   nixosConfigurations = {
  #     ntp2 = nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";
  #       modules = [
  #         ./hosts/default/configuration.nix
  #         home-manager.nixosModules.home-manager {
  #           home-manager.useGlobalPkgs = true;
  #           home-manager.useUserPackages = true;
  #           home-manager.users.nick = ./hosts/default/home.nix;
  #         }
  #       ];
  #     };
  #   };
  # };
