{ ... }:
{
  imports = [
    ./hardware/sob_configuration.nix
    ./base_configuration.nix
    ./desktop/kde.nix
    ./programs/common.nix
    ./programs/virtualization.nix
    ./programs/gaming.nix
  ];
  networking.hostName = "sob"; # Define your hostname.
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.
  services.printing.enable = false; # Printing suppourt
  nixpkgs.config.allowUnfree = true;

}
