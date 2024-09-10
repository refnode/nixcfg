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
    reattach-to-user-namespace
    jq
    yq
    yamllint
    nodePackages.jsonlint
    mas
    direnv
    pdfgrep
    jasper
    abook
    lf
    darwin.iproute2mac
    universal-ctags
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
    htmlq
    lima
    # crypto
    gnupg
    # backup tools
    borgbackup
    borgmatic
    rclone
    tcptraceroute
    unixtools.watch
    fswatch
    keepassxc
    tealdeer
    tree
    socat
    slides
    websocat
    urlscan
  ];

  userPkgsUnstable = with pkgsUnstable; [
    fd
    bat
    eza
    ripgrep
    awscli2
    google-cloud-sdk
    lazygit
    glab
    graphviz
    plantuml-c4
    ffmpeg_7
    msmtp
    docker-client
    fluxcd
    go
    gopls
    goreleaser
    nodejs_22
    yubikey-manager
    platformio
    # encryption
    sops
    # kubernetes tools
    kubectl
    kubectx
    kubelogin
    kubelogin-oidc
    krew
    kustomize
    kube-linter
    kubeconform
    kind
    k9s
    stern
    k6
    openshift
    dive
    crane
    sonobuoy
    ##
    sqlite
    mob
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
