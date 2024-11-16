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

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    # Uses lib.genAttrs to generate a attribute set, in this case using
    # the systems as defined in `supportedSystems` as names.
    # https://nixos.org/manual/nixpkgs/stable/#function-library-lib.attrsets.genAttrs
    # This is a partial function as it misses the function param to lib.genAttrs
    forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

    # Taken from https://github.com/Misterio77/nix-config
    #
    # Let's break that down, because it's a nice example.
    #
    # Let's assume, the function is called as in the formatter output below:
    # pkgsForEachSystem(pkgs: pkgs.alejandra)
    #
    # pkgsForEachSystem is a function takes a function `f` as argument.
    # So `(pkgs: pkgs.alejandra)` is the function passed as argument.
    #
    # In the function body lib.genAttrs takes the list of supportedSystems
    # and maps the list to an attribute set using the function
    # (system: f pkgsFor.${system})
    #
    # Let's assume the iteration passes `x86_64-linux` as system.
    # The function body `(system: f pkgsFor.${system})` then becomes
    # (x86_64-linux: (pkgs: pkgs.alejandra) pkgsFor.x86_64-linux)

    # The function `(pkgs: pkgs.alejandra)` gets `pkgsFor.x86_64-linux` as
    # argument for `pkgs` and finally evaluates to pkgs.x86_64-linux.alejandra.
    pkgsForEachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f pkgsFor.${system});

    # Rewriting the function, taking inspiration from
    # https://github.com/Misterio77/nix-config
    # Using lib.genAttrs to import nixpkgs provides a nice way to quick
    # access or pass pkgs for a certain targetSystem by simply access eg.
    # pkgsFor.x86_64-linux or pkgsFor.${system} as pkgsFor is finally an
    # attribute set, with system keys referencing to nixpkgs for that
    # system.
    pkgsFor = nixpkgs.lib.genAttrs supportedSystems (
      system:
        import nixpkgs {
          inherit system;
          # overlays = [
          #   localOverlays
          # ];
          overlays = localOverlays;
          # activate unfree when I know that I need it.
          config.allowUnfree = false;
        }
    );

    # add local scripts as derivations using an overlay
    # could be also done by just passing additional args to the submodules
    # using the overlay approach, the repo local derivations are addressable
    # by pkgs.myderivation in the submodule
    localOverlays = builtins.attrValues (
      import ./overlays {inherit nixpkgs-unstable;}
    );
  in {
    formatter = pkgsForEachSystem (pkgs: pkgs.alejandra);

    checks = forEachSystem (
      system: let
        pkgs = pkgsFor.${system};
      in
        import ./checks {inherit pre-commit-hooks system;}
    );

    devShells = forEachSystem (
      system: let
        pkgs = pkgsFor.${system};
        checks = self.checks.${system};
      in {
        default = import ./shell.nix {inherit pkgs checks;};
      }
    );

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#defiant
    darwinConfigurations = {
      defiant = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [./hosts/defiant];
        specialArgs = {
          inherit flake inputs;
          system = "aarch64-darwin";
          pkgs = pkgsFor.aarch64-darwin;
        };
      };
    };

    nixosConfigurations = {};
  };
}
