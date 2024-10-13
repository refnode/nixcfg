{
  writeShellApplication,
  pkgs,
}:
# https://github.com/NixOS/nixpkgs/blob/751e9b6c7f8de129532df03806cadf5dc86e9b5d/pkgs/build-support/trivial-builders/default.nix#L187
# The `writeShellApplication` has the benefit that it checks the concatenated
# shell script with shellchecker, while `writeShellScriptBin` not performs
# such a check.
# Probably it's a good idea to disable the shellcheck SC2148 for external
# scripts when there's no first interpreter line present.
writeShellApplication {
  name = "ref-main";

  runtimeInputs = [pkgs.tmux pkgs.gnugrep];

  # excludeShellChecks = [ "SC2148" ];
  text = builtins.readFile ./script.sh;
}
