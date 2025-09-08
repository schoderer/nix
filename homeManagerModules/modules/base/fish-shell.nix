{ pkgs, lib, config, ...}: {
  options.fish-shell = {
    enable = lib.mkEnableOption "fish-shell";
  };
  config = lib.mkIf config.fish-shell.enable {
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