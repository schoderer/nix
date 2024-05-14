{ config, pkgs, ... }: {

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
  environment.systemPackages = with pkgs; [
    podman-compose
  ];
  users.groups.libvirtd.members = [ "michael" ];
}
