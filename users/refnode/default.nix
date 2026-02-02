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
    ./common/optional/llmtools.nix
    ./common/optional/vm.nix
    ./common/optional/nix.nix
  ];

  # specify my home-manager configs
  # home.packages = userPkgs ++ userPkgsUnstable;
  home.packages = with pkgs; [
    curl
    less
    htop
    jq
    yq
    yamllint
    mas
    pdfgrep
    jasper
    lf
    ref-rebuild
    ref-sysupdate
    ref-ykey-check
    ref-irc
    ref-pathlist
    qmk
    gopass
    gopass-jsonapi
    zenith
    htmlq
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
    # encryption
    unstable.sops
    ##
    unstable.sqlite
    unstable.minio-client
    unstable.kanata

    unstable.taskwarrior3
    # unstable.ladybird
  ];

  home.sessionVariables = {
    PAGER = "${pkgs.bat}/bin/bat";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
}
