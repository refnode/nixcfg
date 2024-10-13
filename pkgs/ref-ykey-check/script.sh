# shellcheck disable=SC2148

YUBIKEY_LIST="$HOME/.config/yubico/yubikeys"

# first check if a card is present
if ! gpg --card-status &> /dev/null; then exit 1; fi

# read the attached card serial number
YUBKIKEY=$(gpg --card-status | grep '^Serial number' | sed -e 's/.*: //')

# check against list of known cards
grep -q "$YUBKIKEY" "$YUBIKEY_LIST"
