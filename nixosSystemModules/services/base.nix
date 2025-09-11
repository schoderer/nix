{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.base;
in {
  options.systemconfig.services.base.openssh.enable = lib.mkEnableOption "openssl service";
  options.systemconfig.services.base.flatpak.enable = lib.mkEnableOption "flatpak";
  options.systemconfig.services.base.audio.enable = lib.mkEnableOption "audio";


  services.openssh.enable = cfg.openssh.enable;
  services.flatpak.enable = cfg.flatpak.enable; # Enable Flatpaks


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  config = lib.mkIf cfg.audio.enable {
    # Custom Programs
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