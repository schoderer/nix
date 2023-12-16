default:
    just --list

rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop

home-manager:
    home-manager switch --flake .#michael


update:
    nix flake update
