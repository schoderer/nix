{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "develop";
      enableBluetooth = true;
    };
    desktop = {
      gnome.enable = true;
      niri.enable = true;
    };
    programs = {
      base.enable = true;
      gaming.steam.enable = true;
      virtualization.enable = true;
      ollama.enable = true;
    };
    services = {
      desktop.enable = true;
      embedded.enable = true;
      opentabletdriver.enable = true;
      udev.enable = true;
    };
  };
}
