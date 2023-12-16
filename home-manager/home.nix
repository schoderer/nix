{ config, pkgs, ... }:

{
  home.username = "michael";
  home.homeDirectory = "/home/michael";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Develop
    just
    vscode
    jetbrains-toolbox
    gh

    # Kubernetes
    kubectl
    kubernetes-helm
    k9s
    minikube
    kubie

    # Misc
    firefox
    htop
    ripgrep
    jq
    yq

  ];
  programs = {
    git = {
      enable = true;
      userName = "Michael Schoderer";
      userEmail = "schoderer@proton.me";
      extraConfig = {
        init.defaultbranch = "master";
        push.autosetupremote = true;
        pull.rebase = true;
      };
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
    ".config/helix/config.toml".source = ./dotfiles/helix.toml;
    ".minikube/config/config.json".source = ./dotfiles/minikube.json;
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
