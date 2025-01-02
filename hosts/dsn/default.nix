{
  pkgs,
  modulesPath,
  inputs,
  outputs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "24.11";

  environment.systemPackages = with pkgs; [
    neovim
    git
    pwgen
    rng-tools
    gnupg
    paperkey
    disko
    yubikey-manager
    yubikey-personalization
    yubico-piv-tool
    ref-pathlist
  ];
}
