{pkgs, ...}: {
  imports = [
    ./common/core
    ./common/optional/desktop/darwin.nix
  ];

  # specify my home-manager configs
  # home.packages = userPkgs ++ userPkgsUnstable;
  home.packages = with pkgs; [
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
    ref-pathlist
    ref-git-bare-clone-update
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
    pwgen
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
    qrencode
    wdiff
    cmake
    exiftool
    figlet
    just
    #
    vlc-bin-universal
    # contacts / calendar
    vdirsyncer
    khard
    khal

    unstable.fd
    unstable.eza
    unstable.ripgrep
    unstable.awscli2
    unstable.google-cloud-sdk
    unstable.lazygit
    unstable.glab
    unstable.graphviz
    unstable.plantuml-c4
    unstable.ffmpeg_7
    unstable.msmtp
    unstable.docker-client
    unstable.fluxcd
    unstable.go
    unstable.gopls
    unstable.goreleaser
    unstable.nodejs_22
    unstable.yubikey-manager
    unstable.platformio
    # encryption
    unstable.sops
    # kubernetes tools
    unstable.kubectl
    unstable.kubectx
    unstable.kubelogin
    unstable.kubelogin-oidc
    unstable.krew
    unstable.kustomize
    unstable.kube-linter
    unstable.kubeconform
    unstable.kind
    unstable.k9s
    unstable.stern
    unstable.k6
    unstable.openshift
    unstable.dive
    unstable.crane
    unstable.sonobuoy
    unstable.opentofu
    unstable.kubeone
    ##
    unstable.sqlite
    unstable.mob
  ];

  home.sessionVariables = {
    PAGER = "${pkgs.bat}/bin/bat";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
}
