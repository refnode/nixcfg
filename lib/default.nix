{
  nixpkgs,
  nix-darwin,
  home-manager,
  system,
  user,
  flake,
  ...
}: let
  # system = "aarch64-darwin";
  pkgs = nixpkgs.legacyPackages.${system};
in
  nix-darwin.lib.darwinSystem {
    modules = [
      ../hosts/darwin-base.nix
      {_module.args = {inherit flake;};}
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = import ../${user}.nix {inherit pkgs user;};
        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
        # home-manager.extraSpecialArgs = { inherit lib; };
      }
    ];
  }
