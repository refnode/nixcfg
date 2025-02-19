{
  config,
  lib,
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = true;
    package = pkgs.unstable.aerospace;
    settings = {
      gaps = {
        outer.left = 0;
        outer.bottom = 0;
        outer.top = 0;
        outer.right = 0;
      };

      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        alt-0 = "workspace 0";
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";

        alt-shift-0 = "move-node-to-workspace 0";
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";

        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        # When the application already runs, jump to the workplace and focus
        # the window, if not running start the application.
        cmd-enter = "exec-and-forget ${pkgs.ref-launch-or-focus}/bin/ref-launch-or-focus com.mitchellh.ghostty";
        alt-enter = "exec-and-forget ${pkgs.ref-launch-or-focus}/bin/ref-launch-or-focus com.mitchellh.ghostty";
        alt-f = "exec-and-forget ${pkgs.ref-launch-or-focus}/bin/ref-launch-or-focus com.apple.finder";
      };

      workspace-to-monitor-force-assignment = {
        "0" = "Built-in";
        "1" = "Built-in";
        "2" = "Built-in";
        "3" = "Built-in";
        "4" = "Built-in";
        "5" = "Built-in";
        "6" = "Built-in";
        "7" = "Built-in";
        "8" = "DeskPad";
        "9" = "DeskPad";
      };

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;

      after-login-command = [];
      after-startup-command = [
        "layout tiles"
      ];
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      exec-on-workspace-change = [];
      start-at-login = false;

      key-mapping.preset = "qwerty";

      on-window-detected = [
        {
          check-further-callbacks = true;
          run = [
            "layout tiling"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.keepassxc.keepassxc";
          };
          run = [
            "move-node-to-workspace 0"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.brave.Browser";
          };
          run = [
            "move-node-to-workspace 1"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.mitchellh.ghostty";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "org.whispersystems.signal-desktop";
          };
          run = [
            "move-node-to-workspace 4"
          ];
        }

        {
          check-further-callbacks = false;
          "if" = {
            app-id = "com.stengo.DeskPad";
          };
          run = [
            "move-node-to-workspace 7"
          ];
        }
      ];
    };
  };
}
