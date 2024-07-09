{
  writeShellScriptBin,
  pkgs,
}:
writeShellScriptBin "ref-sysupdate" ''
  NIXCFG=$HOME/src/github.com/refnode/nixcfg.git/main/
  BREW=/opt/homebrew/bin/brew
  cd $NIXCFG
  nix flake update
  ${pkgs.ref-rebuild}/bin/ref-rebuild

  $BREW update && $BREW upgrade
''
