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
  users.users.michael.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPk+r19G1jovsUfe53HBva1iIemANwqZ9h/22cA9p6S devkey"
  ];
}
