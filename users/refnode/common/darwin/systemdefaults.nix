{
  config,
  lib,
  pkgs,
  ...
}: {
  system.defaults = {
    LaunchServices = {
      # Whether to enable quarantine for downloaded applications.
      # The default is true.
      LSQuarantine = true;
    };

    SoftwareUpdate = {
      # Automatically install Mac OS software updates.
      # Defaults to false.
      AutomaticallyInstallMacOSUpdates = false;
    };

    NSGlobalDomain = {
      # Whether to enable automatic capitalization.
      # The default is true.
      NSAutomaticCapitalizationEnabled = false;
      # Whether to enable smart dash substitution.
      # The default is true.
      NSAutomaticDashSubstitutionEnabled = true;
      # Whether to enable automatic spelling correction.
      # The default is true.
      NSAutomaticSpellingCorrectionEnabled = false;
      # Whether to use expanded save panel by default.
      # The default is false.
      NSNavPanelExpandedStateForSaveMode = true;
      # Whether to use expanded save panel by default.
      # The default is false.
      NSNavPanelExpandedStateForSaveMode2 = true;
      # Sets the beep/alert volume level
      # from 0.000 (muted) to 1.000 (100% volume).
      "com.apple.sound.beep.volume" = 0.000;
    };

    controlcenter = {
      AirDrop = false;
      BatteryShowPercentage = false;
      Bluetooth = false;
      Display = false;
      FocusModes = true;
      NowPlaying = false;
      Sound = true;
    };

    dock = {
      # Whether to automatically rearrange spaces based on most
      # recent use. The default is true.
      mru-spaces = false;
      # Position of the dock on screen. The default is “bottom”.
      orientation = "left";
      # Show recent applications in the dock. The default is true.
      show-recents = false;
      # Size of the icons in the dock. The default is 64.
      tilesize = 32;
      # Hot corner action for bottom left corner. Disable it.
      wvous-bl-corner = 1;
      # Hot corner action for bottom right corner. Disable it.
      wvous-br-corner = 1;
      # Hot corner action for top left corner. Disable it.
      wvous-tl-corner = 1;
      # Hot corner action for top right corner. Disable it.
      wvous-tr-corner = 1;
    };

    finder = {
      # Whether to always show file extensions.
      # The default is false.
      AppleShowAllExtensions = true;
      # Whether to always show hidden files.
      # The default is false.
      AppleShowAllFiles = false;
      # Whether to show icons on the desktop or not.
      # The default is true.
      CreateDesktop = false;
      # Change the default search scope.
      # Use “SCcf” to default to current folder.
      # The default is unset (“This Mac”).
      FXDefaultSearchScope = null;
      # Whether to show warnings when change the file extension of files.
      # The default is true.
      FXEnableExtensionChangeWarning = true;
      # Change the default finder view.
      # “icnv” = Icon view, “Nlsv” = List view,
      # “clmv” = Column View, “Flwv” = Gallery View
      # The default is icnv.
      FXPreferredViewStyle = "clmv";
      # Remove items in the trash after 30 days.
      # The default is false.
      FXRemoveOldTrashItems = false;
      NewWindowTarget = "Home";
      # Only when NewWindowTarget = Other
      # NewWindowTargetPath
      # Whether to allow quitting of the Finder.
      # The default is false.
      QuitMenuItem = true;
      # Whether to show external disks on desktop.
      # The default is true.
      ShowExternalHardDrivesOnDesktop = false;
      # Whether to show hard disks on desktop.
      # The default is false.
      ShowHardDrivesOnDesktop = false;
      # Whether to show connected servers on desktop.
      # The default is false.
      ShowMountedServersOnDesktop = false;
      # Show path breadcrumbs in finder windows.
      # The default is false.
      ShowPathbar = true;
      # Whether to show removable media (CDs, DVDs and iPods)
      # on desktop. The default is true.
      ShowRemovableMediaOnDesktop = false;
      # Show status bar at bottom of finder windows with item/disk
      # space stats. The default is false.
      ShowStatusBar = true;
      # Whether to show the full POSIX filepath in the window title.
      # The default is false.
      _FXShowPosixPathInTitle = true;
      # Keep folders on top when sorting by name.
      # The default is false.
      _FXSortFoldersFirst = true;
      # Keep folders on top when sorting by name on the desktop.
      # The default is false.
      # Not really required, because icon view on desktop is disabled.
      _FXSortFoldersFirstOnDesktop = true;
    };

    # capture screenshots in png format to `location` with
    # isodate in the filename
    screencapture = {
      disable-shadow = true;
      include-date = true;
      location = "~/Documents/Screenshots";
      show-thumbnail = true;
      target = "file";
      type = "png";
    };

    # ask for the password to unblock screen when screensaver
    # becomes active
    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };
  };
}
