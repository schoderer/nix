{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.desktop.kde;
in {
  options.systemconfig.desktop.kde = {
    enable = lib.mkEnableOption "kde desktop";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
