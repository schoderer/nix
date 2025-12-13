{...}: {
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
    desktop.gnome.enable = false;
    desktop.kde.enable = true;
    # desktop.niri.enable = true;
    programs = {
      base.enable = true;
      gaming = {
        steam.enable = true;
      };
      virtualization.enable = true;
      blender.enable = false;
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
