{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    darwin.iproute2mac
  ];
}
