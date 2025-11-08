{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.desktop.gnome;
in {
  options.systemconfig.desktop.gnome = {
    enable = lib.mkEnableOption "gnome desktop";
  };

  config = lib.mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
    ]);
    environment.systemPackages = with pkgs; [
      gnome-software
      gnome-tweaks
    ];
  };
}
