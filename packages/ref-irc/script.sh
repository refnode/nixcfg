# shellcheck disable=SC2148

SESSION_NAME="irc"
SESSION_DIR="$HOME"
SESSION_CMD="weechat"

if ! tmux list-session | grep -q "$SESSION_NAME"; then
  tmux new-session -d -s "$SESSION_NAME" -c "$SESSION_DIR" "$SESSION_CMD"
fi

tmux switch-client -t "$SESSION_NAME"
