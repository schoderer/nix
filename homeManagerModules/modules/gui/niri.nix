{ pkgs, config, lib, ...}:
let
    cfg = config.homeconfig.gui.niri;
    theme = "dusk";
    ashellNixPkgs = pkgs.fetchFromGitHub {
      owner = "CodedNil";
      repo = "nixpkgs";
      rev = "b6262549e53369d5cb6ee618423c59c2d208ad65";
      sha256 = "sha256-lczQd0YXwJbs++zSk6xY+FQ8+SOKTYRyQN4OSuPBoMQ=";
    };

    ashellPkgs = import "${ashellNixPkgs}" {
      system = "x86_64-linux";
    };
in {
  options.homeconfig.gui.niri = {
    enable = lib.mkEnableOption "niri Userconfig";
    ashell.enable = lib.mkEnableOption "ashell in niri";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-calendar
      btop
      
      # Swaylock
      swaylock-effects
    ]    ++ lib.optionalAttrs cfg.ashell.enable [ ashellPkgs.ashell ]

    ;
    

    home.file = {
      ".config/niri/config.kdl".source = ./dotfiles/niri.kdl;
      ".config/niri/colors.kdl".source = ./dotfiles/themes/${theme}/niri-colors.kdl;
      ".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
      ".config/fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel.ini;
      ".swaylock/config".source = ./dotfiles/swaylock_config;
      ".config/waybar" = {
        source = ./dotfiles/themes/${theme}/waybar;
        recursive = true;
      };
    }
    // lib.optionalAttrs cfg.ashell.enable {".config/ashell/config.toml".source = ./dotfiles/ashell.toml;}
    ;
  };
}
