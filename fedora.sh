#!/bin/bash
#last tested on Fedora 41

# Packages
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
sudo dnf install bash-completion gnome-shell-extension-dash-to-dock gnome-extensions-app https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf remove totem
sudo dnf update
# Proprietary Stuff
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install libdvdcss rpmfusion-free-release-tainted
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
read -n1 -p "Would you want hardware accelerated codecs? Please select [I]ntel, [A]md, [N]vidia or [S]kip" doit 
case $doit in  
  a|A) sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld && sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld && sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 && sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 ;; 
  i|I) sudo dnf install intel-media-driver ;;
  n|N) sudo dnf install libva-nvidia-driver ;;
  *) echo Skipping ;; 
esac

# Gnome
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
