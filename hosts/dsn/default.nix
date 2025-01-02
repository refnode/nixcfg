{
  pkgs,
  lib,
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

  # Disable networking on boot and for the running system
  # See https://search.nixos.org/options
  boot.initrd.network.enable = lib.mkForce false;
  networking = {
    dhcpcd.enable = lib.mkForce false;
    wireless.enable = lib.mkForce false;
    networkmanager.enable = lib.mkForce false;
  };

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
