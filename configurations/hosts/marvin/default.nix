{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../users/michael.nix
  ];
  systemconfig = {
    base = {
      enable = true;
      hostName = "marvin";
    };
    services = {
      base = {
        enable = true;
        openssh.enable = true;
      };
    };
  };
}
