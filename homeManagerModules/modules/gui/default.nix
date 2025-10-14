{pkgs, lib, config, ...}: {
  imports = [
    ./firefox.nix
    ./gnome-settings.nix
    ./niri.nix
    ./additional_programs.nix
  ];

}
