#!/bin/bash
#uncheck gnome and standard desktop

#packages
sudo apt install -y gnome-core command-not-found flatpak gnome-shell-extension-dashtodock git yaru-theme-icon yaru-theme-gnome-shell gnome-shell-extension-appindicator gnome-tweaks
sudo apt remove -y firefox-esr

#Theme changes
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.desktop.interface icon-theme "Yaru-purple-dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'Yaru-purple-dark'"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42

#Flatpaks
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y org.mozilla.firefox com.discordapp.Discord com.github.tchx84.Flatseal io.github.alainm23.planify org.chromium.Chromium org.gnome.Lollypop org.signal.Signal
