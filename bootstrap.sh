#!/bin/sh

# Install Nix using the Determinate Systems Nix Installer.
# The installer enables the 'experimental' nix flakes feature by default.
curl --proto '=https' --tlsv1.2 -sSf \
  -L https://install.determinate.systems/nix | sh -s -- install

# Fetch gh:refnode/nixcfg main snapshot to $HOME/tmp/nixcfg
TMPDIR="$HOME/tmp2"
curl --proto '=https' --tlsv1.2 -sSf \
  -L https://github.com/refnode/nixcfg/archive/refs/heads/main.tar.gz \
  --create-dirs --output "$TMPDIR/nixcfg.tar.gz"

mkdir -p "$TMPDIR/nixcfg"
tar xzvf "$TMPDIR/nixcfg.tar.gz" \
    --directory "$TMPDIR/nixcfg" \
    --strip-components=1
