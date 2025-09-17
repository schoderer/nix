{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, nixos-hardware, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable-pkgs = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
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
        framework = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            nixos-hardware.nixosModules.framework-13-7040-amd
            ./configurations/hosts/framework
            ./nixosSystemModules
          ];
        };
        marvin = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./configurations/hosts/marvin
            ./nixosSystemModules
          ];
        };
        #######################
        # Cluster
        #######################
        h3k1 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./configurations/hosts/cluster/h3k1
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
          extraSpecialArgs = { inherit inputs unstable-pkgs; };
          modules = [
            ./configurations/homeManager/michael_desktop.nix
            ./homeManagerModules
          ];
        };
      };
    };
}
