{ ... }: {
  imports = [
    ./openssh.nix
    ./desktop.nix
  ];
  # Deactivates networkmanager, which makes the boot time longer
  systemd.services.NetworkManager-wait-online.enable = false;  
#  systemd.services.accounts-daemon.enable = false;
  services.fwupd.enable = true; # Firmware verwaltung und upgrades

}
