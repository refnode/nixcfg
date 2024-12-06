{...}: {
  nix = {
    # package = pkgs.nixVersions.nix_2_16;
    checkConfig = true;
    configureBuildUsers = true;
    settings = {
      # Necessary for using flakes on this system.
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
}
