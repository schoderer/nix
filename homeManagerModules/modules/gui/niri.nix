{ pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.niri;
in {
  options.homeconfig.gui.niri = {
    enable = lib.mkEnableOption "niri Userconfig";
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/niri/config.kdl".source = ./dotfiles/niri.kdl;
      ".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
      ".config/fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel.ini;
      ".config/waybar" = {
        source = ./dotfiles/waybar;
        recursive = true;
      };
    };
  };
}
