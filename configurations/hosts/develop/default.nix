{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostname = "develop";
      enableBluetooth = true;
      enableWifi = false;
    };
    desktop.gnome.enable = true;
    programs = {
      gaming = {
        steam.enable = true;
      };
      virtualization.enable = true;
    };
  };
}