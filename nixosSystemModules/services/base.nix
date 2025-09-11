{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.base;
in {
  options.systemconfig.services.base.openssl.enable = lib.mkEnableOption "openssl service";
  services.openssh.enable = cfg.openssl.enable;
}