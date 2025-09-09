{ ... }: {
  options.systemconfig.programs.virtualization = {
    enable = lib.mkEnableOption "virtualizations programs";
  };

  config = lib.mkIf config.systemconfig.programs.virtualization.enable {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd.enable = true;

      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    environment.systemPackages = with pkgs; [
      podman-compose
    ];
  };
}