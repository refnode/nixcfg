{ pkgs, ... }:

{
  # Virtual machine and container tools for macOS
  
  home.packages = with pkgs; [
    lima  # Linux virtual machines on macOS
  ];
}