{ pkgs, lib, config, ...}: let
    cfg = config.homeconfig.dev.kubernetes;
in {
  options.homeconfig.dev.kubernetes = {
    
    enable = lib.mkEnableOption "devKubernetes";

    defaultEditor = lib.mkOption {
      type = lib.types.str;
      default = "hx";
      example = "hx";
      description = "Default terminal editor to use";
    };
  };


  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # Kubernetes
        minikube
        docker-machine-kvm2 #Needed for minikube podman
        
        kubectl
        kubie
        k9s
        # Helm
        kubernetes-helm
        kubernetes-helmPlugins.helm-diff

        # Dockertools
        dive
      ];
      shellAliases = {
        k = "kubectl";
      };
      file = {
        ".minikube/config/config.json".source = ./dotfiles/minikube.json;
        ".config/distrobox/distrobox.conf".source = ./dotfiles/distrobox/distrobox.conf;
        ".config/containers/policy.json".source = ./dotfiles/containers_policy.json;
      };
      sessionVariables = {
        KUBE_EDITOR = "${cfg.defaultEditor}";
      };
    };
  };
}
