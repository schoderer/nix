{ pkgs, ... }: {
  imports = [
    ./base_desktop.nix
  ];

  programs.hyprland.enable = true;
  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = [
    pkgs.kitty # required for the default Hyprland config
  ];

}
