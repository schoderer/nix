{ config, pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  # Exclude the following packages:
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
  ];

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
}
