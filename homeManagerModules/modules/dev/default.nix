{pkgs, lib, config, ...}: {
  imports = [
    ./dev-basic.nix
    ./dev-kubernetes.nix
    ./dev-gui.nix
    ./dev-ai.nix
  ];

}