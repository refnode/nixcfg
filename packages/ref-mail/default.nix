{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-mail";

  runtimeInputs = [pkgs.tmux pkgs.gnugrep pkgs.neomutt];

  text = builtins.readFile ./script.sh;
}
