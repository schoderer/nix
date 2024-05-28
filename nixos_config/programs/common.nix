{ config, pkgs, ... }: {


  programs = {
    fish.enable = true;
    ssh.startAgent = true;
  };


  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    extraGroups = [ "networkmanager" "wheel" "dialout" "plugdev" "docker"];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };


  environment.systemPackages = with pkgs; [
    git
    helix
    vim
    just
    appimage-run
  ];
}
