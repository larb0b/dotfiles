#!/bin/sh
set -eu
if [ $(id -u) != 0 ]; then
	echo "You must be root to run this script."
	exit 1
fi
echo "Making necessary dirs"
mkdir -p /home/$SUDO_USER/.local/bin
mkdir -p /home/$SUDO_USER/.local/man/man1
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
apt install xorg xinput feh stow i3 tmux firefox vim network-manager golang-go pulseaudio alsa-utils vlc python3-pip build-essential mercurial htop compton -y
echo "Replacing /etc/network/interfaces"
cp interfaces /etc/network/interfaces
echo "Installing dependencies for Plan 9 goodness"
apt install libx11-dev libxext-dev libxt-dev xorg-dev
echo "Cloning, building, and installing plan9port"
git clone https://github.com/9fans/plan9port /usr/local/plan9
( cd "/usr/local/plan9" && ./INSTALL )
echo "Cloning, building, and installing drawterm"
hg clone https://code.9front.org/hg/drawterm /tmp/drawterm
( cd "/tmp/drawterm" && CONF=unix make && mv drawterm /home/$SUDO_USER/.local/bin/drawterm && mv drawterm.1 /home/$SUDO_USER/.local/man/man1/drawterm.1 )
echo "Stowing configs"
stow bgs Xorg-tp bash-tp i3 scripts tmux vim git
echo "Removing temporary files"
rm -rf /tmp/drawterm
echo "Done."
