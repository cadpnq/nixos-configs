{ self, inputs, withSystems, ... }: let
  sharedModules = [
  ];
  
  homeImports = {
    nick = [./nick/home.nix] ++ sharedModules;
  };
  
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];
  
  flake = {
    homeConfigurations = withSystems "x86_64-linux" ({pkgs, ...}: {
      nick = homeManagerConfiguration {
        modules = homeImports.nick;
        inherit pkgs;
      };
    });
  };
}
