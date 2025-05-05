{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      mainUser = "michael";
    in
    {
      partionConfig = {
        h3 = {
          imports = [
            ./installation/hddlayouts/single-ext4.nix
          ];
          disko.devices.disk.main.device = "/dev/vda";
        };
      };
    };
}
