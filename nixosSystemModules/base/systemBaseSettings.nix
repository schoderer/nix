{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.base;
in {
  options.systemconfig.base = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
      description = "Enables base module";
    };
    hostName = lib.mkOption {
      type = lib.types.str;
      example = "hostname";
      description = "Hostname of the system";
    };
    kernelPackage = lib.mkOption {
      type = lib.types.str;
      example = "linuxPackages_latest";
      default = "linuxPackages_latest";
      description = "Linux kernel which should be used";
    };
    enableBluetooth = lib.mkEnableOption "bluetooth";
    enableWifi = lib.mkEnableOption "wifi";
  };

  config = lib.mkIf cfg.enable {
    # Bootloaderconfig

    boot = {
      kernelPackages = pkgs."${cfg.kernelPackage}";
      initrd.systemd.enable = true;
      plymouth.enable = true; # Enable Plymouth, for encrypted boot
      loader = {
        timeout = 1;
        efi.canTouchEfiVariables = true;
        systemd-boot = {
          enable = true;
          configurationLimit = 5;
       };
      };
    };
    # Kernel
    # boot.kernelPackages = pkgs.linuxPackages_latest;

    networking = {
      networkmanager.enable = true;
      hostName = cfg.hostName;
    };

    # Set your time zone.
    time.timeZone = "Europe/Berlin";
    # Set Formats
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };
    };
    # Configure keymap in X11
    services.xserver = {
      xkb.layout = "us";
      xkb.variant = "";
    };

    nix = {
      settings = {
        trusted-users = [ "michael" ];
        experimental-features = [ 
          "nix-command"
          "flakes"
        ];
      };
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
    };


    hardware.bluetooth.enable = cfg.enableBluetooth;
    hardware.bluetooth.powerOnBoot = cfg.enableBluetooth;
    networking.wireless.enable = cfg.enableWifi;
  };
}
