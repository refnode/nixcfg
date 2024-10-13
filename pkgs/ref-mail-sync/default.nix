{
  writeShellApplication,
  pkgs,
}:
writeShellApplication {
  name = "ref-mail-sync";

  runtimeInputs = with pkgs; [
    isync
    gopass
    ref-ykey-check
  ];

  text = builtins.readFile ./script.sh;
}
