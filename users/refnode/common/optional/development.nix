{ pkgs, ... }:

{
  # General development and SCM tools
  
  home.packages = with pkgs; [
    # SCM tools
    git-annex
    git-bug
    gh
    unstable.lazygit
    unstable.glab
    garden
    
    # refnode's own tooling
    ref-git-bare-clone-update
    
    # Development utilities
    cookiecutter
    universal-ctags
    unstable.mob
    
    # Jujutsu VCS
    unstable.jujutsu
  ];
}