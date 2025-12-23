default:
    just --list

update:
    nix flake update
clean:
    home-manager expire-generations -d || true
    home-manager remove-generations old || true
    sudo nix-collect-garbage -d
    nix-collect-garbage -d
    nix store gc
    nix store optimise


#### OS Configurations
rebuild-develop:
    sudo nixos-rebuild boot --flake .#develop

rebuild-framework:
    sudo nixos-rebuild boot --flake .#framework

rebuild-marvin:
    sudo nixos-rebuild boot --flake .#marvin

rebuild-sob:
    sudo nixos-rebuild boot --flake .#sob

### Cluster
rebuild-h3k3:
    sudo nixos-rebuild boot --flake .#h3k3

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
