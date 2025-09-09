{ pkgs, lib, config, ...}: {
  options.homeconfig.fishShell = {
    enable = lib.mkEnableOption "fishShell";
  };
  config = lib.mkIf config.homeconfig.fishShell.enable {
    programs.fish = {
      enable = true;
      shellAbbrs = {
        "+" = "nix shell nixpkgs#";
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