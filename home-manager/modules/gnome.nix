{ pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tray-icons-reloaded
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "emoji-copy@felipeftn"
        "display-brightness-ddcutil@themightydeity.github.com"
      ];
    };
    "org/gnome/shell/extensions/trayIconsReloaded" = {
      icon-padding-horizontal=0;
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
