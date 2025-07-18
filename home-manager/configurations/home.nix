{ config, pkgs, mainUser, ... }:
{
  home.username = "${mainUser}";
  home.homeDirectory = "/home/${mainUser}";

  imports = [
    ../modules/basic.nix
    ../modules/basic-gui.nix
    ../modules/dev.nix
    ../modules/dev-gui.nix
    ../modules/utility.nix
    ../modules/unstable-packages-gui.nix
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
