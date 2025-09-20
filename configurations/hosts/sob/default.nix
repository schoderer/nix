{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "sob";
    };
    desktop.gnome.enable = true;
    programs = {
      base.enable = true;
      virtualization.enable = true;
    };
    services = {
      desktop.enable = true;
    };
  };
}
