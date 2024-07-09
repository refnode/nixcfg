{
  pkgs,
  nix-darwin,
  home-manager,
  system,
  user,
  flake,
  inputs,
  ...
}: let
  osConfig = ../hosts/darwin-base.nix;
  userHomeConfig = ../users/${user};
  systemFn = nix-darwin.lib.darwinSystem;
  home-manager = inputs.home-manager.darwinModules.home-manager;
in
  systemFn {
    modules = [
      osConfig
      {_module.args = {inherit flake;};}
      home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = import userHomeConfig {
          inherit pkgs user;
        };
        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
        # home-manager.extraSpecialArgs = { inherit lib; };
      }
    ];
  }
