{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-irc";

  runtimeInputs = [pkgs.tmux pkgs.weechat-unwrapped];

  text = builtins.readFile ./script.sh;
}
