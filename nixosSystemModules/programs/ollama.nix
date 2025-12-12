{ lib, inputs, pkgs, config, ... }: let
  cfg = config.systemconfig.programs.ollama;

in {
  options.systemconfig.programs.ollama = {
    enable = lib.mkEnableOption "ollama";
  };


  config = lib.mkIf cfg.enable {
    hardware.amdgpu.opencl.enable = true;
    boot.initrd.kernelModules = [ "amdgpu" ];
    environment.systemPackages = [ pkgs.ollama-rocm ];
    services.ollama = {
      enable = false;
      package =  pkgs.ollama-rocm;
    };
  };
}
