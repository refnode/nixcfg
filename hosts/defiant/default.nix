{
  pkgs,
  flake,
  system,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

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
  };

  fonts = {
    packages = [
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
      sandbox = false;
      # substituters = [];
      # trusted-public-keys = [];
      trusted-users = [
        "@admin"
      ];
    };
  };

  programs.zsh.enable = true;

  # TODO https://discourse.nixos.org/t/give-name-label-comment-to-generations/45355
  system.configurationRevision = flake.rev or flake.dirtyRev or null;

  # Used for backwards compatibility,
  # please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  networking = {
    computerName = "defiant";
    hostName = "defiant";
    localHostName = "defiant";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit pkgs;};
    users.refnode = import ../../users/refnode;
  };
}
