{
  pkgs ? import <nixpkgs> {},
  shellHook ? "",
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Git and nix should always be present in the devshell
    git
    # It's quite handy to have home-manager present in the devshell when
    # you want to initialize home-manager on a machine in partly restricted
    # environments. The test case in
    # https://github.com/nix-community/home-manager/blob/master/tests/default.nix
    # trying to fetch from git.sr.ht already killed me in the past.
    home-manager
    # Not really necessary, but doesn't heart.
    alejandra
    # No neovim present REALLY hurts.
    neovim
    curl
    jq
    yq-go
    just
  ];

  inherit shellHook;
}
