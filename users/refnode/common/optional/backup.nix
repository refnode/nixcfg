{ pkgs, ... }:

{
  # Backup and synchronization tools
  
  home.packages = with pkgs; [
    # Backup solutions
    borgbackup
    borgmatic
    rclone
  ];
}