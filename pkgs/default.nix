{pkgs ? import <nixpkgs> {}, ...}: rec {
  ref-rebuild = pkgs.callPackage ../pkgs/ref-rebuild {};
  ref-sysupdate = pkgs.callPackage ../pkgs/ref-sysupdate {};
  ref-ykey-check = pkgs.callPackage ../pkgs/ref-ykey-check {};
  ref-main = pkgs.callPackage ../pkgs/ref-main {};
  ref-mail = pkgs.callPackage ../pkgs/ref-mail {};
  ref-mail-sync = pkgs.callPackage ../pkgs/ref-mail-sync {};
  ref-mail-cd = pkgs.callPackage ../pkgs/ref-mail-cd {};
  ref-mail-cdv = pkgs.callPackage ../pkgs/ref-mail-cdv {};
  ref-irc = pkgs.callPackage ../pkgs/ref-irc {};
  ref-pathlist = pkgs.callPackage ../pkgs/ref-pathlist {};
  ref-git-bare-clone-update = pkgs.callPackage ./ref-git-bare-clone-update {};
}
