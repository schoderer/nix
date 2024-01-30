{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    btop
    ripgrep
    helix
    just
  ];


  programs = {
    ## Fish shell
    fish = {
      enable = true;
      shellAbbrs = {
        k = "kubectl";
        kctx = "kubie ctx";
        distro = "distrobox";
        htop = "btop";
      };
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [];
    };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/helix/config.toml".source = ../dotfiles/helix.toml;
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/michael/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  fonts.fontconfig.enable = true;
}
