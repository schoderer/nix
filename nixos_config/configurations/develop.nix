{ ... }:
{
  imports = [
    ./hardware/develop_configuration.nix
    ./base_configuration.nix
    ../desktop/kde.nix
    ../programs/common.nix
    ../programs/virtualization.nix
    ../programs/gaming.nix
    ../desktop/hardware.nix
  ];
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.
  services.printing.enable = false; # Printing suppourt
  nixpkgs.config.allowUnfree = true;
}
