{
  config,
  pkgs,
  ...
}: {
  home-manager.users.refnode = import ../../../../users/refnode/default.nix;

  imports = [
    ../../../../users/refnode/common/darwin
  ];
}
