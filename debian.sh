#!/bin/bash
#uncheck gnome and standard desktop

sudo apt install gnome-core command-not-found flatpak gnome-shell-extension-dashtodock git yaru-theme-icon yaru-theme-gnome-shell gnome-shell-extension-appindicator
sudo apt remove firefox-esr
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.mozilla.firefox com.discordapp.Discord com.github.tchx84.Flatseal io.github.alainm23.planify org.chromium.Chromium org.gnome.Lollypop org.signal.Signal
