{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    programs.base.enable = true;
    base = {
      enable = true;
      hostName = "marvin";
    };
    services.openssh.enable = true;
  };
}
