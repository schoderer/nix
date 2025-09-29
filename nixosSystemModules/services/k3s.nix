{ pkgs, lib, config, ... }: let
  cfg = config.systemconfig.services.k3s;
in {
  options.systemconfig.services.k3s = {
    enable = lib.mkEnableOption "k3s service";
    token = lib.mkOption {
      type = lib.types.str;
      example = "SecureT0ken";
      description = "Token for cluster joining";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [
      6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
      2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
      2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
      443
      80
    ];
    networking.firewall.allowedUDPPorts = [
      8472 # k3s, flannel: required if using multi-node for inter-node networking
    ];
    services.k3s = {
      enable = true;
      role = "server";
      token = cfg.token; ## todo how to set this securly?
      clusterInit = true;
      extraFlags = toString [
        "--disable=traefik"
      ];
    };
  };
}