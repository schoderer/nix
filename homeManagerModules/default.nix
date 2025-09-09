{...}: {
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./modules/base/user.nix
    ./modules/base/base.nix
    ./modules/base/fish-shell.nix
    ./modules/dev/dev-basic.nix
    ./modules/dev/dev-kubernetes.nix
    ./modules/gui
  ];
}