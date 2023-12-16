{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    jetbrains-toolbox
    gh
    distrobox
    jq
    yq

    # Nix
    nixpkgs-fmt

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
    ".config/distrobox/distrobox-init.sh".source = ../dotfiles/distrobox/distrobox-init.sh;
  };
}