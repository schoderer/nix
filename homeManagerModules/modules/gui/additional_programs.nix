{ pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.additional;
in {
  options.homeconfig.gui.additional = {
    enable = lib.mkEnableOption "additional Userconfig";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs;[
      pureref # Reference Image Viewer
    ];
  };
}
