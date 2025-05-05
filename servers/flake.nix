{
  description = "Nixos-Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      mainUser = "michael";
    in
    {

    };
}
