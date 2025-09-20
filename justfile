default:
    just --list

update:
    nix flake update    
clean:
    sudo nix-collect-garbage -d
    nix-collect-garbage -d
    home-manager expire-generations -d
    nix store gc
    nix store optimise
    home-manager remove-generations old

#### OS Configurations
rebuild-develop:
    sudo nixos-rebuild switch --flake .#develop

rebuild-framework:
    sudo nixos-rebuild switch --flake .#framework

rebuild-marvin:
    sudo nixos-rebuild switch --flake .#marvin

rebuild-sob:
    sudo nixos-rebuild switch --flake .#sob

#### Home-Manager
home-manager:
    home-manager switch -b backup --flake .#michaelDesktop

# Flatpak
flatpak-install:
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user
    flatpak install --user -y flathub org.kicad.KiCad
    flatpak install --user -y flathub org.freecadweb.FreeCAD
    flatpak install --user -y flathub com.prusa3d.PrusaSlicer
    flatpak install --user -y flathub md.obsidian.Obsidian
    flatpak install --user -y flathub           com.heroicgameslauncher.hgl
    flatpak override --user --filesystem=/games com.heroicgameslauncher.hgl
    flatpak install --user -y flathub com.discordapp.Discord
    flatpak install --user -y flathub org.darktable.Darktable
