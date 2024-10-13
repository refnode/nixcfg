# shellcheck disable=SC2148

if ! ref-ykey-check; then
  echo "Yubikey not present ... terminating"
fi

mbsync private-main
