{ pkgs, ... }:

{
  # Virtual machine and container tools for macOS
  
  home.packages = with pkgs; [
    pkgs.nh
    pkgs.nix-output-monitor
    pkgs.unstable.nvd
  ];
}
