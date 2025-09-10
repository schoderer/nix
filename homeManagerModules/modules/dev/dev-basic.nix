{ pkgs, lib, config, ...}: let
    cfg = config.homeconfig.dev.basic;
in {
  options.homeconfig.dev.basic = {
    enable = lib.mkEnableOption "devBasic";
    gitUserName = lib.mkOption {
      description = "git username";
      type = lib.types.str;
      example = "User Name";

    };
    gitUserEmail = lib.mkOption {
      description = "git email";
      type = lib.types.str;
      example = "test@example.com";
    };
  };


  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Language server
      nil # nix language server
      bash-language-server
      marksman # markdown language server

      # Tools
      gh
      cookiecutter
      tokei
      jq # json query
      rclone
    ];

    programs = {
      ## Git
      git = {
        enable = true;
        lfs.enable = true;
        userName = "${cfg.gitUserName}";
        userEmail = "${cfg.gitUserEmail}";
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
  };
}