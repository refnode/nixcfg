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

    configuration = {pkgs, ...}: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment = {
        systemPackages = [
          pkgs.coreutils
          pkgs.vim
          pkgs.git
        ];

        shells = [
          pkgs.bash
          pkgs.zsh
        ];

        loginShell = pkgs.zsh;
      };

      fonts = {
        fontDir.enable = false;
        fonts = [
          (pkgs.nerdfonts.override {
            fonts = [
              "JetBrainsMono"
              "Meslo"
            ];
          })
        ];
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      nix = {
        # package = pkgs.nixVersions.nix_2_16;
        checkConfig = true;
        configureBuildUsers = true;
        settings = {
          # Necessary for using flakes on this system.
          experimental-features = "nix-command flakes";
          allowed-users = [
            "@admin"
          ];
          # disable it, enabling leads to some symlink problems
          # on macOS
          auto-optimise-store = false;
          cores = 6;
          extra-sandbox-paths = [];
          max-jobs = "auto";
          require-sigs = true;
          sandbox = true;
          # substituters = [];
          # trusted-public-keys = [];
        };
      };

      programs.zsh.enable = true;

      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility,
      # please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      networking = {
        computerName = "defiant";
        hostName = "defiant";
        localHostName = "defiant";
      };
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
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      defiant = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./${user}.nix {inherit pkgs user;};
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            # home-manager.extraSpecialArgs = { inherit lib; };
          }
        ];
      };
    };

    nixosConfigurations = {};
  };
}
