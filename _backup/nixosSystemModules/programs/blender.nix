{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.programs.blender;

in {
  options.systemconfig.programs.blender = {
    enable = lib.mkEnableOption "blender";
  };


  config = lib.mkIf cfg.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
    environment.systemPackages = with pkgs; [
      blender-hip
      clinfo
    ];
    hardware.graphics.extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];


  };
}
