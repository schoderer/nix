default:
    just --list

# Lockfile update
update:
    nix flake update

clean:
    nix-collect-garbage -d | grep "freed"
    home-manager expire-generations -d
    nix store gc
    nix store optimise
    home-manager remove-generations old

# base os rebuild
# rebuild-develop:
#    sudo nixos-rebuild switch --flake .#develop
#rebuild-framework:
#    sudo nixos-rebuild switch --flake .#framework
#rebuild-sob:
#    sudo nixos-rebuild switch --flake .#sob

# home-manager
home-manager:
    home-manager switch -b backup --flake .#desktop
# Call with channel like `just home-manager-install 24.11` || 'just home-manager-install master'
home-manager-install CHANNEL:
    nix run home-manager/{{ CHANNEL }} -- init --switch
# Gnome
setup-gnome:
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Flatpak
flatpak-install:
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user
    flatpak install -y flathub org.kicad.KiCad
    flatpak install -y flathub org.freecadweb.FreeCAD
    flatpak install -y flathub com.prusa3d.PrusaSlicer
    flatpak install -y flathub md.obsidian.Obsidian
