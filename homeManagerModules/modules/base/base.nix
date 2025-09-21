{ pkgs, lib, config, ...}: let
    cfg = config.homeconfig.base;  
in {
  options.homeconfig.base = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
      description = "Enables base module";
    };
    defaultEditor = lib.mkOption {
      type = lib.types.str;
      default = "hx";
      example = "hx";
      description = "Default terminal editor to use";
    };
  };
  config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        helix
        ripgrep
        just
        bat # cat alternative
        eza # ls alternative
    ];
    home.shellAliases = {
      ls = "eza --color=always --group-directories-first --icons";
      ll = "eza -la --icons --octal-permissions --group-directories-first";
      l  = "eza -bGF --header --git --color=always --group-directories-first --icons";
    };

    home.file = {
      ".config/helix/config.toml".source = ./dotfiles/helix.toml;
      ".config/helix/languages.toml".source = ./dotfiles/helix_languages.toml;
      ".config/just/justfile".source = ./dotfiles/global_justfile;
    };
    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # Manager then you have to manually source 'hm-session-vars.sh' located at
    # either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    home.sessionVariables = {
      EDITOR = "${cfg.defaultEditor}";
    };
  };
}
