{ pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.niri;
    theme = "dusk";
in {
  options.homeconfig.gui.niri = {
    enable = lib.mkEnableOption "niri Userconfig";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-calendar
      btop
      
      # Swaylock
      swaylock-effects
    ];
    

    home.file = {
      ".config/niri/config.kdl".source = ./dotfiles/niri.kdl;
      ".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
      ".config/fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel.ini;
      ".swaylock/config".source = ./dotfiles/swaylock_config;
      ".config/waybar" = {
        source = ./dotfiles/themes/${theme}/waybar;
        recursive = true;
      };
    };
  };
}
