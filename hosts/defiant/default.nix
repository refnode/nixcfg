{
  pkgs,
  flake,
  system,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../common/core
    ../common/darwin/core
    ../common/users/refnode
  ];

  # TODO https://discourse.nixos.org/t/give-name-label-comment-to-generations/45355
  system.configurationRevision = flake.rev or flake.dirtyRev or null;

  # Used for backwards compatibility,
  # please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  networking = {
    computerName = "defiant";
    hostName = "defiant";
    localHostName = "defiant";
  };

  # home-manager.users.refnode = import ../../users/refnode;
}
