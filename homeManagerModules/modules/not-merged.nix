{
  config,
  lib,
  unstable-pkgs,
  ...
}:
let
  cfg = config.homeconfig.dev.unmerged;

in
{
  options.homeconfig.dev.unmerged = {
    enable = lib.mkEnableOption "unmerged";
  };
  config = lib.mkIf cfg.enable {
  };
}
