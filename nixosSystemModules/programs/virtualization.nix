{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.programs.virtualization;
in {
  options.systemconfig.programs.virtualization = {
    enable = lib.mkEnableOption "virtualizations programs";
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd.enable = true;

      podman = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
    ];
  };
}
