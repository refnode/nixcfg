{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
      style = "numbers,grid,changes,header";
      map-syntax = [
        "flake.lock:JSON"
      ];
    };
    extraPackages = with pkgs.bat-extras; [
      batgrep
      batgrep
      batdiff
      batman
    ];
  };
}
