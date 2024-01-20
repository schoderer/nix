{ config, pkgs, ... }:
{
  imports = [
    ./hardware/home_pc_configuration.nix
    ./base_configuration.nix
    ./desktop/gnome.nix
    ./programs/common.nix
    ./programs/virtualization.nix
    ./programs/gaming.nix
  ];
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.
  services.printing.enable = false; # Printing suppourt
  services.flatpak.enable = true; # Enable Flatpaks
}
