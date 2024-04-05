{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    streamdeck-ui
  ];
}
