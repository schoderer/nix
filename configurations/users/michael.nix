{pkgs, ...}: {
  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    extraGroups = [ "networkmanager" "wheel" "dialout" "libvirtd" ];
  };

}
