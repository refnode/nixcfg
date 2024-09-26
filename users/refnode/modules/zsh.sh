# disable shellcheck for shebang line
# this is a fragment read by the nix configuration
# only extracted to a file to enable other shellcheck checks
# shellcheck disable=SC2148
bindkey -M viins 'jk' vi-cmd-mode
bindkey -r '^['
