{ config, pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    gh
    distrobox
    cookiecutter
    # Tools
    jq
    yq
    tokei

    # Nix
    nixpkgs-fmt
    nixd # Nixlanguage server

    # Rust
    cargo-watch
    # Kubernetes
    kubectl
    kubernetes-helm
    k9s
    minikube
    kubie
  ];

  programs = {
    ## Git
    git = {
      enable = true;
      userName = "Michael Schoderer";
      userEmail = "github.anemic814@passmail.net";
      extraConfig = {
        init.defaultbranch = "master";
        push.autosetupremote = true;
        pull.rebase = true;
      };
    };
    ## Direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.file = {
    ".minikube/config/config.json".source = ../dotfiles/minikube.json;
    ".config/distrobox/distrobox.conf".source = ../dotfiles/distrobox/distrobox.conf;
  };
}
