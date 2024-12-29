default:
    just --list

rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop
rebuild-framework:
    sudo nixos-rebuild switch --flake .#framework

rebuild-sob:
    sudo nixos-rebuild switch --flake .#sob
home-manager:
    home-manager switch -b backup --flake .#desktop

home-manager-server:
    home-manager switch -b backup --flake .#server

update:
    nix flake update

clean:
    sudo nix-collect-garbage -d | grep "freed"
    nix-collect-garbage -d | grep "freed"



reset-gnome-cursor:
    dconf reset /org/gnome/desktop/interface/cursor-theme
