{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-rebuild";

  text = builtins.readFile ./script.sh;
}
