{
  flake.modules.nixos.base = {pkgs, ...} :
  {
    nix = {
      settings = {
        trusted-users = [ "root" ];
        experimental-features = [ 
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };

      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
    };
  };
}