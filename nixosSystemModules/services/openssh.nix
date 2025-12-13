{ lib, config, ... }: let
  cfg = config.systemconfig.services.openssh;
in {
  options.systemconfig.services.openssh.enable = lib.mkEnableOption "openssh service";
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";

      };
    };
  };
}
