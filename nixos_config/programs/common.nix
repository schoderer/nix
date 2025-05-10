{ pkgs, ... }: {


  programs = {
    fish.enable = true;
    ssh.startAgent = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs
        # here, NOT in environment.systemPackages

      ];
    };
  };

  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
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
