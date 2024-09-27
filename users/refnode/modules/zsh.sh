# disable shellcheck for shebang line
# this is a fragment read by the nix configuration
# only extracted to a file to enable other shellcheck checks
# shellcheck disable=SC2148
bindkey -M viins 'jk' vi-cmd-mode
bindkey -r '^['

# source non-nix managed local zsh configuration
if [ -f "$ZDOTDIR/.local.zshrc" ]; then
    # TODO need to check for better style later, works atm
    # shellcheck disable=SC1091
    source "$ZDOTDIR/.local.zshrc"
fi
