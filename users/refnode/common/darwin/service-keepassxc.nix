{
  config,
  lib,
  pkgs,
  homeDirectory,
  ...
}: let
  serviceName = "io.refnode.keepassxc";
in {
  launchd.user.agents.keepassxc = {
    serviceConfig = {
      Label = serviceName;
      StandardOutPath = "${homeDirectory}/Library/Logs/${serviceName}.log";
      StandardErrorPath = "${homeDirectory}/Library/Logs/${serviceName}.error.log";
      KeepAlive = true;
      RunAtLoad = true;
      Program = "${pkgs.keepassxc}/Applications/KeePassXC.app/Contents/MacOS/KeePassXC";
    };
  };
}
