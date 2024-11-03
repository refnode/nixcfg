# shellcheck disable=SC2148

BRANCH=${1:-main}

FLAKE_PATH="$HOME/src/github.com/refnode/nixcfg/$BRANCH"

if [ ! -d "$FLAKE_PATH" ]; then
    echo "Flake path not present $FLAKE_PATH"
    exit 1
fi

darwin-rebuild switch --flake "$FLAKE_PATH"
