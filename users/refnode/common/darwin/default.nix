{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./systemdefaults.nix
    ./aerospace.nix
    ./service-keepassxc.nix
    ./vm.nix
  ];
}
