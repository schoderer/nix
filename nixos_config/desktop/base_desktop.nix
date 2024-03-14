{ config, pkgs, ... }: {
  # Custom Programs
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  boot.plymouth.enable = true; # Enable Plymouth, for encrypted boot
  
   hardware.opentabletdriver.enable = true;

  services.flatpak.enable = true; # Enable Flatpaks
  services.fwupd.enable = true; # Firmware verwaltung und upgrades
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
