{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-mail";

  runtimeInputs = [pkgs.tmux pkgs.gnugrep pkgs.neomutt pkgs.lynx];

  text = builtins.readFile ./script.sh;
}
