#!/bin/sh
# gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user
flatpak install -y flathub com.discordapp.Discord

flatpak install -y flathub org.kicad.KiCad
flatpak install -y flathub org.freecadweb.FreeCAD
flatpak install -y flathub com.prusa3d.PrusaSlicer

flatpak install -y flathub md.obsidian.Obsidian
