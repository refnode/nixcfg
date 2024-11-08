{
  pre-commit-hooks,
  system,
  ...
}: {
  pre-commit-check = pre-commit-hooks.lib.${system}.run {
    src = ./.;
    hooks = {
      # common checks checks
      trim-trailing-whitespace.enable = true;
      mixed-line-endings.enable = true;
      end-of-file-fixer.enable = true;
      check-added-large-files.enable = true;
      check-case-conflicts.enable = true;
      check-merge-conflicts.enable = true;

      # nix file checks
      alejandra.enable = true;

      # markdown checks
      markdownlint.enable = true;

      # yaml checks
      yamllint.enable = true;

      # shell script checks
      shellcheck.enable = true;

      # GitHub actions checks
      actionlint.enable = true;
    };
  };
}
