{
  pkgs ? import <nixpkgs> {},
  ...
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    alejandra
  ];

  shellHook = ''
    echo "Nix development env for tasks running during CI/CD workflows"
  '';
}
