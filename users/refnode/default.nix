{
  pkgs,
  pkgsUnstable,
  user,
  ...
}: let
  userPkgs = with pkgs; [
    curl
    less
    htop
    tmux
    jq
    yq
    pdfgrep
    jasper
    darwin.iproute2mac
    ref-rebuild
    ref-sysupdate
    ref-ykey-check
    ref-main
    ref-mail
    ref-mail-cd
    ref-mail-cdv
    ref-mail-sync
    ref-irc
    cookiecutter
    qmk
    git-annex
    git-bug
    gh
    gopass
    gopass-jsonapi
    zenith
    wezterm
  ];

  userPkgsUnstable = with pkgsUnstable; [
    fd
    bat
    eza
    ripgrep
    awscli2
    lazygit
    glab
    graphviz
    plantuml-c4
    ffmpeg_7
    lima
    docker-client
    fluxcd
    go
    gopls
    goreleaser
    yubikey-manager
    platformio
  ];
in {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.11";

  # specify my home-manager configs
  home.packages = userPkgs ++ userPkgsUnstable;

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
