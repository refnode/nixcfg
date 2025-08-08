{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    iproute2mac
  ];
}
