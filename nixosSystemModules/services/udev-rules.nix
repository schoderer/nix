{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.udev;
in {
  options.systemconfig.services.udev.enable = lib.mkEnableOption "udev rules";


  config = lib.mkIf cfg.enable {
    users.groups.plugdev = {};

    services.udev.extraRules = ''
      # Elgato Stream Deck
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0fd9", TAG+="uaccess", MODE="666", GROUP="plugdev"      
    '';
  };
}
