{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, unstable, home-manager, nixos-hardware, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      
      unstable-pkgs = unstable.legacyPackages.${system};
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
            ./nixos_config/develop.nix
          ];
        };
        framework = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs mainUser; };
          modules = [
            nixos-hardware.nixosModules.framework-13-7040-amd
            ./nixos_config/framework.nix
          ];
        };
        dev_server = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs mainUser; };
          modules = [
            ./nixos_config/dev_server.nix
          ];
        };

      };

      ##
      # Homemanagerconfig
      ##
      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser unstable unstable-pkgs; };
          modules = [
            ./home-manager/home.nix
          ];
        };
        server = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser unstable-pkgs; };
          modules = [
            ./home-manager/server.nix
          ];
        };
      };
    };
}
