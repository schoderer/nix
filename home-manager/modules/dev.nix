{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    git-lfs
    distrobox
    cookiecutter
    # Tools
    jq
    yq
    pkg-config
    openssl
    # Nix
    nixpkgs-fmt
    nixd # Nixlanguage server

    # Rust
    bacon # Rust code watcher
    # Kubernetes
    kubectl
    kubernetes-helm
    kubernetes-helmPlugins.helm-diff
    k9s
    kubie

    # Minikube
    minikube
    docker-machine-kvm2 # Minikube driver needed for Nixos

  ];

  programs = {
    ## Git
    git = {
      enable = true;
      lfs.enable = true;
      userName = "Michael Schoderer";
      userEmail = "github.anemic814@passmail.net";
      extraConfig = {
        init.defaultbranch = "main";
        push.autosetupremote = true;
        pull.rebase = true;
        column.ui = "auto";
        commit.gpgsign = true;
        gpg.format = "ssh";
        branch.sort = "-committerdate";
        user.signingkey = "~/.ssh/id_ed25519.pub";
        tag.sort = "version:refname";
        diff = {
          alogrithm = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = true;
        };
        fetch = {
          prune = true;
          pruneTags = true;
          all = true;
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
          updateRefs = true;
        };
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
