{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      #######################
      # Systemconfiguration
      #######################
      nixosConfigurations = {
        develop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./configurations/hosts/develop
            ./nixosSystemModules
          ];
        };
      };
      #######################
      # Homemanagerconfig
      #######################
      homeConfigurations = {
        michaelDesktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./configurations/homeManager/michael_desktop.nix
            ./homeManagerModules            
          ];
        };
      };
    };
}
