{
  pkgs,
  flake,
  ...
}: {
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

  system.configurationRevision = flake.rev or flake.dirtyRev or null;

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
}
