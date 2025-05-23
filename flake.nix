{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "nixpkgs/nixos-unstable";
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
      # Systemconfig
      ##
      nixosConfigurations = {
        develop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs mainUser; };
          modules = [
            ./nixos_config/configurations/develop.nix
          ];
        };
        framework = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs mainUser; };
          modules = [
            nixos-hardware.nixosModules.framework-13-7040-amd
            ./nixos_config/configurations/framework.nix
          ];
        };
        sob = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs outputs mainUser; };
            modules = [
              ./nixos_config/configurations/sob.nix
            ];
          };
      };

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
