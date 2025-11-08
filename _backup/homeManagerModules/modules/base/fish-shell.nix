{ pkgs, lib, config, ...}: let
    cfg = config.homeconfig.fishShell;
in {
  options.homeconfig.fishShell = {
    enable = lib.mkEnableOption "fishShell";
  };
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAbbrs = {
        "+" = "nix shell nixpkgs#";
      };
      shellAliases = {
        "?" = "nix search nixpkgs ";
      };
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [];
    };
    # Add `~/scripts` to path
    home.sessionPath = [
      "$HOME/scripts"
    ];
    fonts.fontconfig.enable = true;
  };
}
