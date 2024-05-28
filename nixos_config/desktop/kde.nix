{ config, pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

  # Exclude the following packages:
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
}
