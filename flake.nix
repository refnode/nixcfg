{
  description = "refnode's Nix configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
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

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # add local scripts as derivations using an overlay
    # could be also done by just passing additional args to the submodules
    # using the overlay approach, the repo local derivations are addressable
    # by pkgs.myderivation in the submodule
    localOverlays = import ./overlays;

    pkgsForSystem = system:
      import nixpkgs {
        overlays = [
          localOverlays
        ];
        inherit system;
      };

    unstablePkgsForSystem = system:
      import nixpkgs-unstable {
        # if you have additional overlays, you may add them here
        overlays = [];
        inherit system;
      };
  in {
    formatter = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        pkgs.alejandra
    );

    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        # based on example
        # https://github.com/cachix/pre-commit-hooks.nix#nix-flakes-support
        preCommitCheck = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
            shellcheck.enable = true;
            yamllint.enable = true;
            markdownlint.enable = true;
            actionlint.enable = true;
          };
        };
        shellHook = preCommitCheck.shellHook;
      in {
        ci = import ./ci.nix {inherit pkgs shellHook;};
      }
    );

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#defiant

    darwinConfigurations = let
      system = "aarch64-darwin";
      pkgs = pkgsForSystem system;
      pkgsUnstable = unstablePkgsForSystem system;
    in {
      defiant = import ./lib {
        inherit
          pkgs
          pkgsUnstable
          nix-darwin
          home-manager
          system
          user
          flake
          inputs
          ;
      };
    };

    nixosConfigurations = {};
  };
}
