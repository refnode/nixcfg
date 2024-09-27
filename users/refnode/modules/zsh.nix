{config, ...}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";

    autocd = true;

    dirHashes = {
      bin = "$HOME/bin";
      gh = "$HOME/src/github.com";
      ref = "$HOME/src/github.com/refnode";
      dl = "$HOME/Downloads";
      tmp = "$HOME/tmp";
      docs = "$HOME/Documents";
    };

    history.extended = true;
    history.ignoreDups = true;
    history.ignorePatterns = [
      "kill *"
      "gopass *"
    ];
    history.ignoreSpace = true;
    history.save = 10000;
    history.share = true;
    history.size = 10000;

    autosuggestion.enable = true;
    autosuggestion.highlight = "fg=#d8dee9,bg=#4c566a";

    initExtra = builtins.readFile ./zsh.sh;
  };

  # enable the fzf zsh integration by default history, file and directory
  # fuzzy searches are available on zsh vi insert mode. As I prefer to
  # use fzf in vi cmd mode, I normally don't need the keymaps provided,
  # but it's more effort to skip them out atm. I don't like finger
  # breaking ctrl/option sport on regular keyboards.
  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = ["--preview 'tree -C {} | head -200'"];
    colors = {
      bg = "#1e1e1e";
      "bg+" = "#1e1e1e";
      fg = "#d4d4d4";
      "fg+" = "#d4d4d4";
    };
    defaultCommand = "fd --type f";
    defaultOptions = ["--height 40%" "--border" "--prompt='> '"];
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = ["--preview 'bat --style=numbers --color=always --line-range :500 {}'"];
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];
    tmux.enableShellIntegration = true;
    tmux.shellIntegrationOptions = ["-d 40%"];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
