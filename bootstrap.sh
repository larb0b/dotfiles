#!/bin/sh
set -eu
if [ "$(cd .. && pwd)" != "$HOME" ]; then
	echo "Current directory must be in the root of your home folder."
	exit 1
fi
if [ "${1-}" != "tp" -a "${1-}" != "dt" ]; then
	echo "Usage: bootstrap.sh [tp/dt]"
	exit 2
fi
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo "Making necessary dirs"
mkdir -p ~/.local/bin
mkdir -p ~/.local/man/man1
mkdir -p ~/Backgrounds
echo "Removing ~/.bashrc"
[ -e ~/.bashrc ] && rm ~/.bashrc
echo "Updating apt and installing packages"
sudo apt update
sudo apt install xorg xinput feh stow i3 tmux firefox vim network-manager golang-go pulseaudio alsa-utils vlc python3-pip build-essential mercurial htop compton libx11-dev libxext-dev libxt-dev xorg-dev fonts-liberation -y
echo "Installing Python stuff (pip3)"
pip3 install youtube-dl
echo "Replacing /etc/network/interfaces"
sudo cp interfaces /etc/network/interfaces
echo "Cloning, building, and installing plan9port"
sudo git clone https://github.com/9fans/plan9port /usr/local/plan9
sudo sh -c 'cd "/usr/local/plan9" && ./INSTALL'
echo "Cloning, building, and installing drawterm"
hg clone https://code.9front.org/hg/drawterm /tmp/drawterm
sudo sh -c 'cd "/tmp/drawterm" && CONF=unix make'
cp /tmp/drawterm/drawterm ~/.local/bin/drawterm
cp /tmp/drawterm/drawterm.1 ~/.local/man/man1/drawterm.1
echo "Cloning, building, and installing st"
git clone https://git.suckless.org/st st-git
cp st/config.h st-git/config.h
sh -c 'cd st-git && make'
cp st-git/st ~/.local/bin/st
echo "Stowing general configs"
stow i3 tmux vim Xorg
if [ "$1" = "tp" ]; then
	echo "Stowing tp configs"
	stow tp 
	echo "Installing tp Xorg configuration"
	sudo mkdir -p /etc/X11/xorg.conf.d
	sudo cp 20-intel.conf /etc/X11/xorg.conf.d
	sudo cp 50-trackpoint.conf /etc/X11/xorg.conf.d
elif [ "$1" = "dt" ]; then
	echo "Stowing dt configs"
	stow dt
fi
echo "Installing scripts"
cp -R scripts/* ~/.local/bin/
echo "Removing temporary files"
sudo rm -rf /tmp/drawterm
rm -rf st-git
echo "Done."
