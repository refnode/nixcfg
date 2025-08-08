{nixpkgs-unstable, ...}: {
  addons = final: prev: import ../pkgs {pkgs = final;};

  unstable-pkgs = final: prev: {
    unstable = import nixpkgs-unstable {
      system = final.system;
      # activate unfree when I know that I need it.
      config.allowUnfree = true;
    };
  };
}
