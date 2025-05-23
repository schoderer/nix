{ pkgs, ...}: {
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
    };
    "org/gnome/desktop/interface" = {
      color-scheme="prefer-dark";
      cursor-size=24;
      cursor-theme="Adwaita";
      icon-theme="Adwaita";
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
}
