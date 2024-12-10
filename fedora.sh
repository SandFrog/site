#!/bin/bash
#last tested on Fedora 41

# Packages
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf install bash-completion gnome-shell-extension-dash-to-dock gnome-extensions-app -y

# Gnome
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
