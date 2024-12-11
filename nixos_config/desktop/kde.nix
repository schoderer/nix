{ pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;

  # Exclude the following packages:
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
  ];
}
