{...}: {
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./modules/base
    ./modules/dev
    ./modules/gui
    ./modules/security-utils.nix
  ];
}