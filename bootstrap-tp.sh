#!/bin/sh
set -eu
if [ $(id -u) != 0 ]; then
	echo "You must be root to run this script."
	exit 1
fi
echo "Making necessary dirs"
mkdir -p /home/$SUDO_USER/.local/bin
mkdir -p /home/$SUDO_USER/Backgrounds
mkdir -p /etc/X11/xorg.conf.d
echo "Removing ~/.bashrc"
if [ -ne /home/$SUDO_USER/.bashrc ]; then
	rm /home/$SUDO_USER/.bashrc
fi
echo "Copying TearFree Xorg config"
cp 20-intel.conf /etc/X11/xorg.conf.d
echo "Updating apt and installing packages"
apt update
apt install xorg xinput feh stow i3 tmux firefox vim network-manager golang-go pulseaudio alsa-utils vlc python3-pip build-essential mercurial -y
echo "Stowing configs"
stow bgs Xorg-tp bash-tp i3 scripts tmux vim git
echo "Done. Note: remove your ethernet interface from /etc/network/interfaces if you want it to be managed by Network Manager."
