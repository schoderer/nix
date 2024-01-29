{ config, pkgs, ... }:
{
  imports = [
    ./hardware/tuxedo_configuration.nix
    ./base_configuration.nix
    ./desktop/gnome.nix
    ./programs/common.nix
    ./programs/virtualization.nix
    ./programs/gaming.nix
  ];
  networking.hostName = "tuxedo"; # Define your hostname.
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  services.printing.enable = false; # Printing suppourt
}
