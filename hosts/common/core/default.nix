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
  home-manager.extraSpecialArgs = {
    inherit pkgs inputs;
  };
}
