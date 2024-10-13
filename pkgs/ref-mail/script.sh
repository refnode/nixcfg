# shellcheck disable=SC2148

SESSION_NAME="mail"
SESSION_DIR="$HOME/.Mail/private"
SESSION_CMD="neomutt"

if ! tmux list-session | grep -q "$SESSION_NAME"; then
  tmux new-session -d -s "$SESSION_NAME" -c "$SESSION_DIR" "$SESSION_CMD"
fi

tmux switch-client -t "$SESSION_NAME"
