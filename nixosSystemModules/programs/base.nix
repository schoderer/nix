{ ... }: {
  options.systemconfig.programs.base = {
    enable = lib.mkEnableOption "base programs";
  };

  config = lib.mkIf config.systemconfig.programs.base.enable {
    environment.systemPackages = with pkgs; [
      git
      helix
      just
    ];
    programs = {
      fish.enable = true;
      ssh.startAgent = true;
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          # Add any missing dynamic libraries for unpackaged programs
          # here, NOT in environment.systemPackages
        ];
      };
    };
  };
}
