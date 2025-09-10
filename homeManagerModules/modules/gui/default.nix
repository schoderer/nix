{pkgs, lib, config, ...}: {
  imports = [
    ./firefox.nix
    ./gnome-settings.nix
    
  ];

}
