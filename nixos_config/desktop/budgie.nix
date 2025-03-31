{ pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];
  services.xserver.enable = true;
  services.xserver.desktopManager.budgie.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # Optional: 
  services.displayManager.defaultSession = "budgie-desktop";
}
