{ pkgs, lib, config, ...}: {
  options.devKubernetes = {
    enable = lib.mkEnableOption "devKubernetes";
    defaultEditor = lib.mkOption {
      type = lib.types.str;
      default = "hx";
      example = "hx";
      description = "Default terminal editor to use";
    };
  };


  config = lib.mkIf config.devKubernetes.enable {
    home = {
      packages = with pkgs; [
        # Kubernetes
        minikube
        kubectl
        kubernetes-helm
        kubernetes-helmPlugins.helm-diff
        k9s
        kubie
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
        KUBE_EDITOR = "${config.devKubernetes.defaultEditor}";
      };
    };
  };
}