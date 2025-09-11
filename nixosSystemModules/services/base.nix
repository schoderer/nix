{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.base;
in {
  options.systemconfig.services.base = {
    enable = lib.mkEnableOption "base services";
    openssh.enable = lib.mkEnableOption "openssl service";
    flatpak.enable = lib.mkEnableOption "flatpak";
    audio.enable = lib.mkEnableOption "audio";
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  config = lib.mkIf cfg.enable {
      services.openssh.enable = cfg.openssh.enable;
      services.flatpak.enable = cfg.flatpak.enable; # Enable Flatpaks
      
  } // lib.mkIf cfg.audio.enable { # Using `//` to merge the attribute sets
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