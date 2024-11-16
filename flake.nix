{
  description = "refnode's Nix configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-darwin,
    home-manager,
    pre-commit-hooks,
    ...
  }: let
    user = "refnode";
    flake = self;

    lib =
      nixpkgs.lib
      // nix-darwin.lib
      // home-manager.lib
      // import ./lib {inherit inputs;};
  in {
    inherit lib;
    formatter = lib.refnode.pkgsForEachSystem (pkgs: pkgs.alejandra);

    checks = lib.refnode.forEachSystem (
      system: let
        pkgs = lib.refnode.pkgsFor.${system};
      in
        import ./checks {inherit pre-commit-hooks system;}
    );

    devShells = lib.refnode.forEachSystem (
      system: let
        pkgs = lib.refnode.pkgsFor.${system};
        checks = self.checks.${system};
      in {
        default = import ./shell.nix {inherit pkgs checks;};
      }
    );

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#defiant
    darwinConfigurations = {
      defiant = lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [./hosts/defiant];
        specialArgs = {
          inherit flake inputs;
          system = "aarch64-darwin";
          pkgs = lib.refnode.pkgsFor.aarch64-darwin;
        };
      };
    };

    nixosConfigurations = {};
  };
}
