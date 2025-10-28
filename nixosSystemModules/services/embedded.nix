{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.embedded;
in {
  options.systemconfig.services.embedded.enable = lib.mkEnableOption "embedded service";


  config = lib.mkIf cfg.enable {
    users.groups.plugdev = {};
    environment.systemPackages = with pkgs; [
      cyme
      usbutils
      pulseview
      picotool
    ];
    services.udev.extraRules = ''
      # Allow Access to all RPi Devices
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", TAG+="uaccess", MODE="666", GROUP="plugdev"
      # SeenGreat logic analyzer
      SUBSYSTEM=="usb", ATTRS{idVendor}=="1d50",ATTRS{idProduct}=="608c", TAG+="uaccess", MODE="666", GROUP="plugdev"
    '';
  };
}
