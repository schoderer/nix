{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    distrobox
    # Tools
    jq
    yq
    tokei
    hyperfine

    # Nix
    nixpkgs-fmt

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
        gpg.format = "ssh";
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO10xSRLGOMQgKTMlbIy0GHEBQ1u7Lio/FR5iLaGSxmC";
        commit.gpgsign = true;
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
