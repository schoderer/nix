{ config, pkgs, ... }:
{
  imports = [
    ./hardware/dev_server_configuration.nix
    ./base_configuration.nix
    ./programs/common.nix
    ./programs/virtualization.nix
  ];
  networking.hostName = "dev-server"; # Define your hostname.
  services.printing.enable = false; # Printing suppourt
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  services.openssh.enable = true;
}
