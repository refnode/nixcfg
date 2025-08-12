{pkgs, ...}: {
  imports = [
    ./common/core
    ./common/optional/desktop/darwin.nix
    ./common/optional/kubernetes.nix
    ./common/optional/rust.nix
    ./common/optional/mailtools.nix
    ./common/optional/backup.nix
    ./common/optional/golang.nix
    ./common/optional/development.nix
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
    lf
    universal-ctags
    ref-rebuild
    ref-sysupdate
    ref-ykey-check
    ref-main
    ref-irc
    ref-pathlist
    qmk
    gopass
    gopass-jsonapi
    zenith
    wezterm
    htmlq
    lima
    # crypto
    gnupg
    pwgen
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

    unstable.fd
    unstable.eza
    unstable.ripgrep
    unstable.awscli2
    unstable.google-cloud-sdk
    unstable.graphviz
    unstable.plantuml-c4
    unstable.ffmpeg_7
    unstable.nodejs_22
    unstable.yubikey-manager
    unstable.platformio
    # encryption
    unstable.sops
    ##
    unstable.sqlite
    unstable.mob
    pkgs.garden
    unstable.jujutsu
    unstable.minio-client
    unstable.kanata

    unstable.taskwarrior3
    # unstable.ladybird
    unstable.claude-code
  ];

  home.sessionVariables = {
    PAGER = "${pkgs.bat}/bin/bat";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
}
