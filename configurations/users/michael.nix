{pkgs, ...}: {
  programs.fish.enable = true;
  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "dialout" "libvirtd" ];
  };

}
