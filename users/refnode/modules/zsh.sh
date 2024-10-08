# disable shellcheck for shebang line
# this is a fragment read by the nix configuration
# only extracted to a file to enable other shellcheck checks
# shellcheck disable=SC2148
bindkey -M viins 'jk' vi-cmd-mode
bindkey -r '^['

# I prefer to leave the vi insert mode and use fzf widgets
# on vi cmd mode. Align the keymaps the nvim used style.
bindkey -M vicmd '/' fzf-history-widget
bindkey -M vicmd ' ff' fzf-file-widget
bindkey -M vicmd ' fd' fzf-cd-widget

# the check wants to see the curly braces quoted, disfunctional
# shellcheck disable=SC2139
alias -s {yaml,yml,json,toml}='$EDITOR'
# shellcheck disable=SC2139
alias -s {txt,md,adoc,rst}='$EDITOR'
# shellcheck disable=SC2139
alias -s {rs,go,py}='$EDITOR'
# shellcheck disable=SC2139
alias -s {sql,csv}='$EDITOR'

# source non-nix managed local zsh configuration
if [ -f "$ZDOTDIR/.local.zshrc" ]; then
    # TODO need to check for better style later, works atm
    # shellcheck disable=SC1091
    source "$ZDOTDIR/.local.zshrc"
fi
