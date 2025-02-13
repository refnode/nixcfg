{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./zsh
    ./direnv.nix
  ];
  home.username = "refnode";
  home.homeDirectory = pkgs.lib.mkForce "/Users/refnode";
}
