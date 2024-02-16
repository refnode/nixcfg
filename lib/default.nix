{
  nixpkgs,
  nix-darwin,
  home-manager,
  system,
  user,
  flake,
  inputs,
  ...
}: let
  userHomeConfig = ../users/${user};
  pkgs = nixpkgs.legacyPackages.${system};
  systemFn = nix-darwin.lib.darwinSystem;
  home-manager = inputs.home-manager.darwinModules.home-manager;
in
  systemFn {
    modules = [
      ../hosts/darwin-base.nix
      {_module.args = {inherit flake;};}
      home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = import userHomeConfig {inherit pkgs user;};
        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
        # home-manager.extraSpecialArgs = { inherit lib; };
      }
    ];
  }
