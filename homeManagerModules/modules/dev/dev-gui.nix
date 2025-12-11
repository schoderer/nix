{ config, lib, unstable-pkgs, ... }: let
    cfg = config.homeconfig.dev.gui;
in {
  options.homeconfig.dev.gui = {
    enable = lib.mkEnableOption "devGui";
  };
  config = lib.mkIf cfg.enable {
    home.packages = with unstable-pkgs; [
        vscode
        jetbrains-toolbox
        kingstvis
        bruno
    ];
  };
}
