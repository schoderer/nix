{ config, pkgs, ... }:
{
  imports = [
    ./hardware/framework_configuration.nix
    ./base_configuration.nix
    ./desktop/gnome.nix
    ./programs/common.nix
    ./programs/virtualization.nix
    ./programs/gaming.nix
  ];
  networking.hostName = "framework"; # Define your hostname.
  services.printing.enable = false; # Printing suppourt
}
