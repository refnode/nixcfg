{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-Space";
    sensibleOnTop = true;
    mouse = true;
    # shell = "reattach-to-user-namespace -l ${pkgs.zsh}/bin/zsh";
    # shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.nord
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.fzf-tmux-url;
        extraConfig = ''
          set -g @fzf-url-history-limit '2000'
        '';
      }
      {
        plugin = tmuxPlugins.session-wizard;
      }
    ];
    extraConfig = ''
      # unbind some unliked defaults
      unbind '"'
      unbind %
      unbind Up
      unbind Down
      unbind Left
      unbind Right

      # Rebind split plane and let the new pane open with the current
      # working directory of the current pane.
      bind _ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind-key Enter run-shell "${pkgs.ref-main}/bin/ref-main"

      # Enable a keybind layer for additional mappings.
      # As tmux only accepts a single key for keybinds, this configuration
      # creates a new table similar to the ones of copy-mode or copy-mode-vi.
      # So Ctrl-Space as the choosen prefix for this tmux config,
      # followed by another Space enters the "leader" with the following
      # keybindings to the given features.
      bind-key Space switch-client -T leader
      bind-key -T leader ,     command-prompt -I "#W" "rename-window '%%'"
      bind-key -T leader Enter run-shell "${pkgs.ref-main}/bin/ref-main"

      set-option -g default-command "reattach-to-user-namespace -l zsh"

      source-file ~/.config/tmux/local.tmux
    '';
  };
}
