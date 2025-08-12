{ pkgs, ... }:

{
  # Rust development tools
  
  home.packages = with pkgs; [
    # Rust toolchain
    unstable.rustup
  ];
}