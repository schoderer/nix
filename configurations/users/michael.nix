{pkgs, ...}: {
  programs.fish.enable = true;
  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    extraGroups = [ "networkmanager" "wheel" "dialout" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      appimage-run
    ];
  };

}
