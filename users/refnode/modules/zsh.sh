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


# fzf widget to filter on a list of git worktrees in $HOME/src
# The base of this code is the fzf-cd-widget distributed by the fzf project.
# Customization of cmd and PREVIEW_OPTS to see the first 20 commit log
# messages as preview for the current selected directory.
fzf-git-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local cmd="fd --max-depth=6 --hidden --type=file '^\.git$' $HOME/src | sed -e 's/\/\.git$//'"
  local PREVIEW_OPTS="--preview 'cd {} && git log -20'"
  # shellcheck disable=SC2155
  local dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $PREVIEW_OPTS" fzf +m)

  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  # shellcheck disable=SC2034 # wrong interpretation, BUFFER is used by zle accept-line
  # shellcheck disable=SC2296
  BUFFER="builtin cd -- ${(q)dir:a}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}

# Register fzf-git-widget add key bindings for vicmd mode
zle     -N             fzf-git-widget
bindkey -M vicmd ' fg' fzf-git-widget


# source non-nix managed local zsh configuration
if [ -f "$ZDOTDIR/.local.zshrc" ]; then
    # TODO need to check for better style later, works atm
    # shellcheck disable=SC1091
    source "$ZDOTDIR/.local.zshrc"
fi
