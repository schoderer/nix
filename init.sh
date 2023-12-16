#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
echo "Linking home-manager files"
ln -sf $SCRIPT_DIR/home-manager ~/.config
ln -sf $SCRIPT_DIR/nixpkgs ~/.config