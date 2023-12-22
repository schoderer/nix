#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
echo "Linking home-manager files"
ln -sf $SCRIPT_DIR/home-manager ~/.config
ln -sf $SCRIPT_DIR/nixpkgs ~/.config
echo "Link nixos config"
sudo ln -sf $SCRIPT_DIR/nixos_config/configuration.nix /etc/nixos/configuration.nix
sudo ln -sf $SCRIPT_DIR/nixos_config/home_pc_configuration.nix /etc/nixos/home_pc_configuration.nix
