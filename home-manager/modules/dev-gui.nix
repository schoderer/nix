{ config, pkgs, unstable, ... }:
{
  programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
      ];
      userSettings = {
        hour_format = "hour24";
        auto_update = false;
        telemetry ={
          enable_crash_reporter = false;
          enable_telemetry = false;
        };
      };
   };
}
