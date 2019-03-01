#!/bin/sh
set -eu
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo "Making necessary dirs"
mkdir -p /home/$SUDO_USER/.local/bin
mkdir -p /home/$SUDO_USER/.local/man/man1
mkdir -p /home/$SUDO_USER/Backgrounds
mkdir -p /etc/X11/xorg.conf.d
echo "Removing ~/.bashrc"
if [ ! -f /home/$SUDO_USER/.bashrc ]; then
	rm /home/$SUDO_USER/.bashrc
fi
echo "Copying TearFree Xorg config"
sudo cp 20-intel.conf /etc/X11/xorg.conf.d
echo "Updating apt and installing packages"
sudo apt update
sudo apt install xorg xinput feh stow i3 tmux firefox vim network-manager golang-go pulseaudio alsa-utils vlc python3-pip build-essential mercurial htop compton -y
echo "Replacing /etc/network/interfaces"
sudo cp interfaces /etc/network/interfaces
echo "Installing dependencies for Plan 9 goodness"
sudo apt install libx11-dev libxext-dev libxt-dev xorg-dev
echo "Cloning, building, and installing plan9port"
sudo git clone https://github.com/9fans/plan9port /usr/local/plan9
sudo bash -c 'cd "/usr/local/plan9" && ./INSTALL'
echo "Cloning, building, and installing drawterm"
hg clone https://code.9front.org/hg/drawterm /tmp/drawterm
sudo bash -c 'cd "/tmp/drawterm" && CONF=unix make && mv drawterm /home/$SUDO_USER/.local/bin/drawterm && mv drawterm.1 /home/$SUDO_USER/.local/man/man1/drawterm.1'
echo "Stowing configs"
stow bgs Xorg-tp bash-tp i3 tmux vim git
echo "Installing pfirefox script"
cp scripts/pfirefox /home/$SUDO_USER/.local/bin/pfirefox
echo "Removing temporary files"
rm -rf /tmp/drawterm
echo "Done."
