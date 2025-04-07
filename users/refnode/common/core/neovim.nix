{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = [
      pkgs.unstable.nixd
    ];
  };
}
