{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./zsh
    ./direnv.nix
    ./bat.nix
    ./neovim.nix
  ];

  home.stateVersion = "24.11";

  home.username = "refnode";
  home.homeDirectory = pkgs.lib.mkForce "/Users/refnode";

  programs.home-manager.enable = true;
}
