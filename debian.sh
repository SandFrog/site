#!/bin/bash
#last tested on debian 12
#uncheck all boxes

#packages
sudo apt update
sudo apt install -y gnome-core command-not-found flatpak gnome-shell-extension-dashtodock git yaru-theme-icon yaru-theme-gnome-shell gnome-shell-extension-appindicator gnome-tweaks net-tools software-properties-common
sudo apt purge -y firefox-esr
sudo apt-add-repository --component non-free contrib non-free-firmware -y


#other changes
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
echo "PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin" >> ~/.bashrc
echo "alias update=\"sudo apt update && sudo apt upgrade -y && flatpak update -y\"" >> ~/.bashrc
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.desktop.interface icon-theme "Yaru-purple-dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'Yaru-purple-dark'"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

#flatpaks
sudo -v
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y org.mozilla.firefox com.discordapp.Discord com.github.tchx84.Flatseal io.github.alainm23.planify org.chromium.Chromium org.gnome.Lollypop org.signal.Signal


sudo rm /etc/network/interfaces
sudo /sbin/shutdown -r now
