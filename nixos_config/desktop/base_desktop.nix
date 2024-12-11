{ ... }: {
  # Custom Programs
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  boot.plymouth.enable = true; # Enable Plymouth, for encrypted boot

  services.flatpak.enable = true; # Enable Flatpaks
  services.fwupd.enable = true; # Firmware verwaltung und upgrades
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
}
