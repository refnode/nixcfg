{
  pre-commit-hooks,
  system,
  ...
}: {
  pre-commit-check = pre-commit-hooks.lib.${system}.run {
    src = ./.;
    hooks = {
      alejandra.enable = true;
      shellcheck.enable = true;
      yamllint.enable = true;
      markdownlint.enable = true;
      actionlint.enable = true;
    };
  };
}
