{...}: {
  imports = [
    ./hardware-configuration-2.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "develop";
      enableBluetooth = true;
      enableWifi = false;
    };
    desktop.gnome.enable = true;
    programs = {
      base.enable = true;
      gaming = {
        steam.enable = true;
      };
      virtualization.enable = true;
    };
  };
}
