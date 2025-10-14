{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.desktop;
in {
  options.systemconfig.services.desktop.enable = lib.mkEnableOption "desktop service";
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  config = lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        appimage-run
      ];
      # Custom Programs
      # Enable flatpak for easy installation of desktop applications.
      services.flatpak.enable = true;
      # services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };      
  };
}
