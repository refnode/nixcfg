{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-git-bare-clone-update";

  runtimeInputs = [pkgs.git pkgs.gnugrep];

  text = builtins.readFile ./script.sh;
}
