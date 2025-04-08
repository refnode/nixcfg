{
  flake,
  system,
  hostname,
  ...
}: {
  # Used for backwards compatibility,
  # please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # TODO https://discourse.nixos.org/t/give-name-label-comment-to-generations/45355
  system.configurationRevision = flake.rev or flake.dirtyRev or null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  networking = {
    computerName = "${hostname}";
    hostName = "${hostname}";
    localHostName = "${hostname}";
  };

  environment.systemPath = ["/opt/homebrew/bin"];
}
