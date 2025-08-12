{ pkgs, ... }:

{
  # Go development tools
  
  home.packages = with pkgs; [
    # Go toolchain
    unstable.go
    unstable.gopls
    unstable.goreleaser
  ];
}