{config, pkgs, ...}: {
  imports = [
    ./base_desktop.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WAYLAND = "1";
  };
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  environment.systemPackages = with pkgs; [
    waybar
    mako
    swww
    kitty
    rofi-wayland
    wl-clipboard
  ];
}
