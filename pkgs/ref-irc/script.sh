# shellcheck disable=SC2148

SESSION_NAME="irc"
SESSION_DIR="$HOME"
SESSION_CMD="weechat"

if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux new-session -d -s "$SESSION_NAME" -c "$SESSION_DIR" "$SESSION_CMD"
fi

tmux switch-client -t "$SESSION_NAME"
