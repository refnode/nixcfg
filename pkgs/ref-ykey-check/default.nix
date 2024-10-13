{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-ykey-check";

  runtimeInputs = [pkgs.gnupg pkgs.gnugrep pkgs.gnused];

  # excludeShellChecks = [ "SC2148" ];
  text = builtins.readFile ./script.sh;
}
