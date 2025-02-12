{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = "refnode";
  home.homeDirectory = pkgs.lib.mkForce "/Users/refnode";
}
