{
  writeShellScriptBin,
  pkgs,
}:
writeShellScriptBin "ref-rebuild" ''
  darwin-rebuild switch --flake $HOME/src/github.com/refnode/nixcfg.git/main
''
