{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-pathlist";

  runtimeInputs = [pkgs.gnused];

  text = builtins.readFile ./script.sh;
}
