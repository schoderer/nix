{ pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.gnomeSettings;
    user = config.homeconfig.user.username;
    user-homedir = config.home.homeDirectory;
in {
  options.homeconfig.gui.gnomeSettings = {
    enable = lib.mkEnableOption "gnomeSettings";
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/wallpaper.jpg".source = ./dotfiles/themes/greenLeaf/green-unsplash.jpg;
    };
    home.packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.tray-icons-reloaded
      # Themeing
      adwaita-icon-theme
    ];
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "dash-to-dock@micxgx.gmail.com"
          "trayIconsReloaded@selfmade.pl"
        ];
      };
      "org/gnome/shell/extensions/trayIconsReloaded" = {
        icon-padding-horizontal=0;
        icon-size=16;
      };
      "org/gnome/desktop/interface" = {
        color-scheme="prefer-dark";
        cursor-size=16;
        cursor-theme="Adwaita";
        icon-theme="Adwaita";
      };
      "org/gnome/desktop/background" = {
        picture-uri="file:///${user-homedir}/.config/wallpaper.jpg";
        picture-uri-dark="file:///${user-homedir}/.config/wallpaper.jpg";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout=":minimize,maximize,close";
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        background-opacity=0.8;
        custom-theme-shrink=true;
        dash-max-icon-size=40;
        dock-position="BOTTOM";
        height-fraction=0.9;
        multi-monitor=true;
        running-indicator-style="DOTS";
      };
    };
  };
}
