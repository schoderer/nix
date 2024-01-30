{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      mainUser = "michael";
    in
    {
      nixosConfigurations = {
        develop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs mainUser; };
          system = "x86_64-linux";
          modules = [
            ./nixos_config/develop.nix
          ];
        };
        tuxedo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs mainUser; };
          system = "x86_64-linux";
          modules = [
            ./nixos_config/tuxedo.nix
          ];
        };
        framework = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs mainUser; };
          system = "x86_64-linux";
          modules = [
            ./nixos_config/framework.nix
          ];
        };
      };
      homeConfigurations = {
        desktop = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser; };
          modules = [
            ./home-manager/home.nix
          ];
        };
        server = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs mainUser; };
          modules = [
            ./home-manager/server.nix
          ];
        };
      };
    };
}
