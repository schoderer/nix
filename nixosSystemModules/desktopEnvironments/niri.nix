{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.desktop.niri;
in {
  options.systemconfig.desktop.niri = {
    enable = lib.mkEnableOption "niri desktop";
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite # To start x11 Applications like Electron in niri
      alacritty # Terminal
      fuzzel # Application Menu
      mako # Notificationdaemon
      swww # Background manager
      # Waybar
      waybar # Applicationbar
      pavucontrol # Volumecontrol
      wlogout
      swaylock
      bluetui # bluetooth management
      gnome-keyring
    ];
  };
}
