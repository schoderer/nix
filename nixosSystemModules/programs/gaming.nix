{ pkgs, lib, config, ... }: {
  options.systemconfig.programs.gaming.steam = {
    enable = lib.mkEnableOption "steam";
  };


  config = lib.mkIf config.systemconfig.programs.gaming.steam.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    };
    hardware.steam-hardware.enable = true;
  };
}
