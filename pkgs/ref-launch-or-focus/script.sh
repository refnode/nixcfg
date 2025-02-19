# shellcheck disable=SC2148

# Something like com.apple.finder
# To request the Id of an app call eg.
# osascript -e 'id of app "Finder"'
APP="$1"
CMD="aerospace"

# Get the numeric window id from aerospace
window_id=$($CMD list-windows --monitor all --app-id "$APP" --json | jq '.[]."window-id"')

# In theory it should also be sufficient to only call
# 'open -b "$APP"' without the -n flag, to open or
# focus the macOS App, but the option to filter the
# aerospace window list in the prefered way is a bit
# more flexible.
if [ -z "$window_id" ]; then
    open -b "$APP"
else
    $CMD focus --window-id "$window_id"
fi
