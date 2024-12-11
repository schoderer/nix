{ pkgs, ... }: {


  programs = {
    fish.enable = true;
    ssh.startAgent = true;
  };


  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    extraGroups = [ "networkmanager" "wheel" "dialout" "plugdev" "udev"];
    shell = pkgs.fish;
    packages = with pkgs; [
      appimage-run
    ];
  };


  environment.systemPackages = with pkgs; [
    git
    helix
    just
  ];
}
