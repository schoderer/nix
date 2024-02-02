default:
    just --list

rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop
rebuild-tuxedo:
    sudo nixos-rebuild switch --flake .#tuxedo
rebuild-framework:
    sudo nixos-rebuild switch --flake .#framework


home-manager:
    home-manager switch --flake .#desktop

home-manager-server:
    home-manager switch --flake .#server

update:
    nix flake update
