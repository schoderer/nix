{ config, pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]);
  environment.systemPackages = with pkgs; [
    gnome-software
  ];
}
