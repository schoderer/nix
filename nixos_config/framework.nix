{ config, pkgs, ... }:
{
  imports = [
    ./hardware/home_pc_configuration.nix
    ./base_configuration.nix
    ./desktop/gnome.nix
    ./programs/common.nix
    ./programs/virtualization.nix
#    ./programs/gaming.nix
  ];
  networking.hostName = "framework"; # Define your hostname.
  services.printing.enable = false; # Printing suppourt
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

}
