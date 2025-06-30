{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, unstable, home-manager, nixos-hardware, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      mainUser = "michael";
    in
    {
      ##
      # Homemanagerconfig
      ##
      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser system unstable; };
          modules = [
            ./home-manager/configurations/home.nix
          ];
        };
        server = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser system unstable; };
          modules = [
            ./home-manager/configurations/server.nix
          ];
        };
      };
    };
}
