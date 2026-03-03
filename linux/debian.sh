#!/bin/bash
#Last tested on Debian 13
#At software selection, select: Debian desktop environment, GNOME, standard system utilities

if ! gnome-extensions enable ubuntu-appindicators@ubuntu.com &>/dev/null; then
    #Packages
    sudo apt update
    sudo apt install -y command-not-found git flatpak gnome-software-plugin-flatpak \
        gnome-shell-extension-dashtodock gnome-shell-extension-appindicator gnome-tweaks
    sudo apt purge -y firefox-esr totem showtime
    sudo sed -i.old '/^deb\(-src\)\? / s/ main.*/ main contrib non-free non-free-firmware/' /etc/apt/sources.list
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub -y io.github.celluloid_player.Celluloid org.mozilla.firefox
    
    if whiptail --title "Steam Setup" --yesno "Do you want to install Steam and 32-bit libraries?" 0 0; then
        echo "Installing Steam..."
        sudo dpkg --add-architecture i386
        sudo apt update
        sudo apt install -y steam-installer
    else
        echo "Skipping Steam."
    fi
    
    #Hide grub
    sudo sed -i \
        -e 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' \
        -e '/^GRUB_TIMEOUT=0/a GRUB_TIMEOUT_STYLE=hidden' /etc/default/grub
    
    #Other changes
    echo "PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin" >> ~/.bashrc
    echo "alias update=\"sudo apt update && sudo apt upgrade -y && flatpak update -y\"" >> ~/.bashrc
    
    echo -e "\e[1;97;44mPlease log out, log back in and re-run this script to enable extensions.\e[0m"
else
    #Gnome
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
    gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gnome-extensions enable ubuntu-appindicators@ubuntu.com
    gnome-extensions enable dash-to-dock@micxgx.gmail.com
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
    gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
    gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
fi
