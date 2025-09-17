{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "h3k1";
    };
    services.openssh.enable = true;
  };
}
