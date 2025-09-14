{ config, lib, pkgs, ... }: let
    cfg = config.homeconfig.security-utils;
in {
  options.homeconfig.security-utils = {
    enable = lib.mkEnableOption "devGui";
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
        sops # https://github.com/getsops/sops
        age # https://github.com/FiloSottile/age
    ];
  };
}
