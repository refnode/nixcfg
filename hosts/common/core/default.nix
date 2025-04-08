{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./nix.nix
    ./fonts.nix
  ];

  environment = {
    systemPackages = [
      pkgs.coreutils
      pkgs.neovim-unwrapped
      pkgs.git
    ];

    shells = [
      pkgs.bash
      pkgs.zsh
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  # define backup file extension to enable automatic moves
  # of existing files as backup during initial takeover of config files
  # instead of failing hm runs.
  home-manager.backupFileExtension = "hm-backup";
  home-manager.extraSpecialArgs = {
    inherit pkgs inputs;
  };
}
