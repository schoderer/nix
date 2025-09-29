{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "h3k3";
    };
    programs.base.enable = true;
    services.openssh.enable = true;
  };
}
