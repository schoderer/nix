{ pkgs, ...}: {
  home.packages = with pkgs; [
    btop
    ripgrep
    helix
    just
    dive
    nil # nix language server
    bash-language-server
    ruff # python language server
    marksman # markdown language server
    cyme # lsusb alternative
    tldr # man compacted
    rclone
    bat
    

    fastfetch
    zellij # Terminal Multiplexer
  ];
  home.sessionPath = [
    "$HOME/scripts"
  ];

  programs = {
    ## Fish shell
    fish = {
      enable = true;
      shellAbbrs = {
        k = "kubectl";
        htop = "btop";
        "+" = "nix shell nixpkgs#";
        diveResult = "dive --source docker-archive (gunzip -c $(readlink result) | psub)";
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
    ".config/zellij/layouts/rust.kdl".source = ../dotfiles/zellij-layouts/rust.kdl;
    ".config/zellij/config.kdl".source = ../dotfiles/zellij.kdl;
    ".config/helix/config.toml".source = ../dotfiles/helix.toml;
    ".config/helix/languages.toml".source = ../dotfiles/helix_languages.toml;
    ".config/containers/policy.json".source = ../dotfiles/containers_policy.json;
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
    KUBE_EDITOR = "hx";
  };

  fonts.fontconfig.enable = true;
}
