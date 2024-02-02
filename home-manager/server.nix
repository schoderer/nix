{ config, pkgs, specialArgs, ... }:

{
  home.username = "${specialArgs.mainUser}";
  home.homeDirectory = "/home/${specialArgs.mainUser}";
  home.file = {
    ".ssh/authorized_keys".source = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII0xljXLdKlJ7g6cbbq3FznMBhYI1xX4YYwHoGBloROQ internal";
  };
  imports = [
    ./modules/basic.nix
    ./modules/dev.nix
  ];
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
