#!/bin/sh

nix --extra-experimental-features repl-flake repl '.#'
