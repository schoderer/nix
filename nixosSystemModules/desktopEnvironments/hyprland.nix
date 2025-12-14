{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.desktop.hyprland;
in {
  options.systemconfig.desktop.hyprland = {
    enable = lib.mkEnableOption "hyprland desktop";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    services.displayManager.lightdm.enable = true;


    environment.systemPackages = with pkgs; [
      alacritty # Terminal
      fuzzel # Application Menu
      ashell
    ];

  };
}
