{
  # https://direnv.net/man/direnv.toml.1.html
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      whitelist = {
        prefix = [
          "~/src/github.com/refnode/nixcfg"
        ];
      };
    };
  };
}
