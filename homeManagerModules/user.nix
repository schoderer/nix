{ pkgs, lib, config, ...}: {
  options.user = {
    username = lib.mkOption {
      type = lib.types.str;
      example = "user";
      description = "Username";
      apply = lib.strings.toLower;
    };
  };
  config = lib.mkIf ((builtins.stringLength config.user.username) > 0) {
    home = {
      username = "${config.user.username}";
      homeDirectory = "/home/${config.user.username}";

      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update the value, then make sure to first check the Home Manager
      # release notes.
      stateVersion = "25.05"; # Please read the comment before changing.
    };
  };
}