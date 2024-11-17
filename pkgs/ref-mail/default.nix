{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-mail";

  runtimeInputs = [pkgs.tmux pkgs.neomutt pkgs.lynx];

  text = builtins.readFile ./script.sh;
}
