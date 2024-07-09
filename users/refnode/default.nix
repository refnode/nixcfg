{
  pkgs,
  user,
  ...
}: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";

  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    htop
    tmux
    jq
    yq
    ref-rebuild
    ref-sysupdate
  ];

  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  home.username = "${user}";
  home.homeDirectory = pkgs.lib.mkForce "/Users/${user}";

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
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
