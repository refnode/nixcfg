{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-irc";

  runtimeInputs = [pkgs.tmux pkgs.gnugrep pkgs.weechat-unwrapped];

  text = builtins.readFile ./script.sh;
}
