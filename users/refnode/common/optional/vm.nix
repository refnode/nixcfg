{ pkgs, ... }:

{
  # Virtual machine and container tools for macOS
  
  home.packages = with pkgs; [
    unstable.lima  # Linux virtual machines on macOS
  ];
}
