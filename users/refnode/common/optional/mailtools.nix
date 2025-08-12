{ pkgs, ... }:

{
  # Mail tools for email management and scripting
  
  home.packages = with pkgs; [
    # Mail clients
    neomutt
    unstable.himalaya
    
    # Mail utilities
    unstable.msmtp
    unstable.mu
    abook
    
    # refnode's own tooling
    ref-mail
    ref-mail-cd
    ref-mail-cdv
    ref-mail-sync
    
    # Contacts and calendar
    vdirsyncer
    khard
    khal
  ];
}
