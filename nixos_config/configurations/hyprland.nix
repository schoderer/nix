{ ... }:
{
  imports = [
    ./hardware/hyprland_configuration.nix
    ./base_configuration.nix
    ../programs/common.nix
  ];
  networking.hostName = "hyprland"; # Define your hostname.
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.
  services.printing.enable = false; # Printing suppourt
  nixpkgs.config.allowUnfree = true;

}
