# shellcheck disable=SC2148

SESSION_NAME="main"
SESSION_DIR="$HOME"

if ! tmux server-info > /dev/null 2>&1; then
  tmux new-session -s "$SESSION_NAME" -c "$SESSION_DIR"
  exit 0
fi

if ! tmux list-session | grep -q "$SESSION_NAME"; then
  tmux new-session -d -s "$SESSION_NAME" -c "$SESSION_DIR"
fi

tmux switch-client -t "$SESSION_NAME"
