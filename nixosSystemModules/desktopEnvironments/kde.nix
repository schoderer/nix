{ pkgs, lib, config, pkgs, ... }: {
  options.systemconfig.desktop.kde = {
    enable = lib.mkEnableOption "kde desktop";
  };

  config = lib.mkIf config.systemconfig.desktop.kde.enable {
    # Enable the KDE Desktop Environment.
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    # Exclude the following packages:
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
    ];

    environment.systemPackages = with pkgs; [
      kdePackages.partitionmanager
      kdePackages.ksshaskpass
    ];
    programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
  };
}
