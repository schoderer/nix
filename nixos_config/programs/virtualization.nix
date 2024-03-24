{ config, pkgs, ... }: {

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
  users.groups.libvirtd.members = [ "michael" ];

  networking.extraHosts = [
    "192.168.122.100 vm1"
    "192.168.122.101 vm2"
    "192.168.122.102 vm3"
    "192.168.122.103 vm4"
    "192.168.122.104 vm5"
    "192.168.122.105 vm6"
    "192.168.122.106 vm7"
    "192.168.122.107 vm8"
    "192.168.122.108 vm9"
  ];

}
