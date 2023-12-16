{ config, pkgs, ... }: {
  # Custom Programs
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  boot.plymouth.enable = true; # Enable Plymouth, for encrypted boot

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
