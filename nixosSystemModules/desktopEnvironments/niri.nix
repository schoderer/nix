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
      bluetui # bluetooth management
      gnome-keyring
      nautilus # filemanager
      loupe # image viewer
      
    ];
    programs = {
      evince.enable = true; # pdf viewer
      gnome-disks.enable = true;
      seahorse.enable = true;
    };

    services.gnome.sushi.enable = true;
  };
}
