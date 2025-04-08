{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./aerospace.nix
    ./service-keepassxc.nix
  ];
}
