default:
    just --list
update:
    nix flake update
clean:
    nix-collect-garbage -d | grep "freed"
    home-manager expire-generations -d
    nix store gc
    nix store optimise
    home-manager remove-generations old

home-manager:
    home-manager switch -b backup --flake .#michaelDesktop
home-manager-install CHANNEL:
    nix run home-manager/{{ CHANNEL }} -- init --switch
# Gnome
setup-gnome:
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"



# Flatpak
flatpak-install:
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user
    flatpak install --user -y flathub org.kicad.KiCad
    flatpak install --user -y flathub org.freecadweb.FreeCAD
    flatpak install --user -y flathub com.prusa3d.PrusaSlicer
    flatpak install --user -y flathub md.obsidian.Obsidian
    flatpak install --user -y flathub com.valvesoftware.Steam
    flatpak override --user --filesystem=/games com.valvesoftware.Steam
    flatpak override --user --filesystem=/home/michael/dev com.valvesoftware.Steam
    flatpak install --user -y flathub           com.heroicgameslauncher.hgl
    flatpak override --user --filesystem=/games com.heroicgameslauncher.hgl
    flatpak install --user -y flathub com.discordapp.Discord
    flatpak install --user -y flathub org.darktable.Darktable
