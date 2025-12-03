{ pkgs, lib, config, ... }: let 
  cfg = config.systemconfig.programs.base;
in {
  options.systemconfig.programs.base = {
    enable = lib.mkEnableOption "base programs";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      helix
      just
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    programs = {
      fish.enable = true;
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          # Add any missing dynamic libraries for unpackaged programs
          # here, NOT in environment.systemPackages
        ];
      };
    };
  };
}
