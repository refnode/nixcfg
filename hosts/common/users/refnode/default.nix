{
  config,
  pkgs,
  username,
  homeDirectory,
  ...
}: {
  home-manager.users.${username} = import ../../../../users/${username}/default.nix;

  imports = [
    ../../../../users/${username}/common/darwin
  ];
}
