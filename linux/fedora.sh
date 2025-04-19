#!/bin/bash
#last tested on Fedora 41

# Packages
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf install bash-completion gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-extensions-app https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf remove -y totem
sudo dnf update -y
# Proprietary Stuff
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf install -y libdvdcss rpmfusion-free-release-tainted
sudo dnf update -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
read -n1 -p "Would you want hardware accelerated codecs? Please select [I]ntel, [A]md, [N]vidia or [S]kip" doit 
case $doit in  
  a|A) sudo dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld && sudo dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld && sudo dnf swap -y mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 && sudo dnf swap -y mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 ;; 
  i|I) sudo dnf install -y intel-media-driver ;;
  n|N) sudo dnf install -y libva-nvidia-driver ;;
  *) echo Skipping ;; 
esac

# Gnome
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
