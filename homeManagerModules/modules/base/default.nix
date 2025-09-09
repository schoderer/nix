{pkgs, lib, config, ...}: {
  imports = [
    ./user.nix
    ./base.nix
    ./fish-shell.nix
  ];

}