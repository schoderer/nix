{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.opentabletdriver;
in {
  options.systemconfig.services.opentabletdriver = {
    enable = lib.mkEnableOption "opentabletdriver service";
  };

  config = lib.mkIf cfg.enable {
    hardware.opentabletdriver.enable = true;
  };
}