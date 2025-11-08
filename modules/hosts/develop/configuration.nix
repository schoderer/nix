{
  flake.modules.nixos."nixosConfigurations/develop" =
    { config, ... }:
    {

      networking.hostName = "develop";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}