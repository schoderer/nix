{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.desktop.niri;
in {
  options.systemconfig.desktop.niri = {
    enable = lib.mkEnableOption "niri desktop";
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;


    environment.systemPackages = with pkgs; [
      alacritty # Terminal
      fuzzel # Application Menu
      waybar # Applicationbar
      swaylock #Lockscreen
      mako # Notificationdaemon


      xwayland-satellite
    ];
  };
}
