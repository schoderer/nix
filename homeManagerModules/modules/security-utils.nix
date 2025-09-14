{ config, lib, pkgs, ... }: let
    cfg = config.homeconfig.security-utils;
in {
  options.homeconfig.security-utils = {
    enable = lib.mkEnableOption "security utils like sops and age";
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
        sops # https://github.com/getsops/sops
        age # https://github.com/FiloSottile/age
    ];
  };
}
