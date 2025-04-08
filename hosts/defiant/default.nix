{
  lib,
  flake,
  inputs,
}: let
  system = "aarch64-darwin";
  hostname = "defiant";
  username = "refnode";
  homeDirectory = "/Users/${username}";
in
  lib.darwinSystem {
    inherit system;
    modules = [
      # ./hosts/defiant
      inputs.home-manager.darwinModules.home-manager
      ../common/core
      ../common/darwin/core
      # probably I need to import the nix-darwin for a user first
      # and the import the home-manager config after
      ../common/users/${username}
    ];
    specialArgs = {
      inherit flake inputs system hostname username homeDirectory;
      pkgs = lib.refnode.pkgsFor.aarch64-darwin;
    };
  }
