default:
    just --list

rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop
rebuild-tuxedo:
    sudo nixos-rebuild switch --flake .#tuxedo

home-manager:
    home-manager switch --flake .#michael


update:
    nix flake update
