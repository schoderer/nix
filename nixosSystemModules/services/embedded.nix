{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.embedded;
in {
  options.systemconfig.services.embedded.enable = lib.mkEnableOption "embedded service";


  config = lib.mkIf cfg.enable {
    users.groups.plugdev = {};
    environment.systemPackages = with pkgs; [
      cyme
    ];
    services.udev.extraRules = ''


      # https://github.com/raspberrypi/picotool/blob/25aa087b2c517b4901874a99536e869d4d27b678/udev/60-picotool.rules#L4
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", TAG+="uaccess", MODE="660", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0009", TAG+="uaccess", MODE="660", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000a", TAG+="uaccess", MODE="660", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000f", TAG+="uaccess", MODE="660", GROUP="plugdev"
    '';
  };
}