{ config, pkgs, ... }: {

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;

    docker.enable = true;
    #podman = {
    #  enable = true;
    #  dockerCompat = true;
    #  defaultNetwork.settings.dns_enabled = true;
    # };
  };
  environment.systemPackages = with pkgs; [
    podman-compose
  ];
  users.groups.libvirtd.members = [ "michael" ];
  users.extraGroups.docker.members = [ "michael" ];
}
