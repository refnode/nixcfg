{
  pkgs ? import <nixpkgs> {},
  shellHook ? "",
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    alejandra
  ];

  inherit shellHook;
}
