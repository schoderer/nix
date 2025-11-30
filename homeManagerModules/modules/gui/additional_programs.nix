{ pkgs, unstable-pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.additional;
in {
  options.homeconfig.gui.additional = {
    enable = lib.mkEnableOption "additional Userconfig";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.pureref # Reference Image Viewer
      unstable-pkgs.proton-pass
      unstable-pkgs.zed-editor
      unstable-pkgs.lmstudio
    ];
  };
}
