{
  imports = [
    ../hddlayouts/single-ext4.nix
  ];
  disko.devices.disk.main.device = "/dev/vda";
}