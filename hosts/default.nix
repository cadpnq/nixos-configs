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
        ../modules
        ./ntp2
        ../users/nick
        home-manager.nixosModules.home-manager {
          home-manager.users.nick.imports = homeImports.nick;
        }
        # {home-manager.users.nick.imports = homeImports.nick;}
      ];
    };
  };
}
