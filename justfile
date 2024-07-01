default:
    just --list

rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop
rebuild-tuxedo:
    sudo nixos-rebuild switch --flake .#tuxedo
rebuild-framework:
    sudo nixos-rebuild switch --flake .#framework
rebuild-dev-server:
    sudo nixos-rebuild switch --flake .#dev_server

home-manager:
    home-manager switch -b backup --flake .#desktop

home-manager-server:
    home-manager switch -b backup --flake .#server

update:
    nix flake update

clean:
    sudo nix-collect-garbage -d | grep "freed"
    nix-collect-garbage -d | grep "freed"
