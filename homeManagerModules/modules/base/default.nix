{pkgs, lib, config, ...}: {
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./base.nix
    ./fish-shell.nix
  ];
}