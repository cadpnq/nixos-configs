{
  inputs,
  homeImports,
  ...
} : {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    home-manager = inputs.home-manager;
  in {
    ntp2 = nixosSystem {
      modules = [
        inputs.stylix.nixosModules.stylix
        ../modules
        ../modules/gnome.nix
        ../modules/theme.nix
        ./ntp2
        ../users/nick
        home-manager.nixosModules.home-manager {
          home-manager.users.nick.imports = homeImports.nick;
        }
      ];
    };
    vm = nixosSystem {
      modules = [
        inputs.stylix.nixosModules.stylix
        ../modules
        ../modules/gnome.nix
        ../modules/theme.nix
        ./vm
        ../users/nick
        home-manager.nixosModules.home-manager {
          home-manager.users.nick.imports = homeImports.nick;
        }
      ];
    };
  };
}
