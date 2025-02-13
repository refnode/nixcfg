{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./zsh
  ];
  home.username = "refnode";
  home.homeDirectory = pkgs.lib.mkForce "/Users/refnode";
}
