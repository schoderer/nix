{ ... }: {
  # Custom Programs
  # services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  

  services.flatpak.enable = true; # Enable Flatpaks
  services.fwupd.enable = true; # Firmware verwaltung und upgrades
   # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}