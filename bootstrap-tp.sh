#!/bin/bash
set -e
if [ $(id -u) != 0 ]; then
	echo "You must be root to run this script."
	exit 1
fi
echo "Making necessary dirs"
mkdir -p ~/.local/bin
mkdir -p ~/Backgrounds
mkdir -p /etc/X11/xorg.conf.d
echo "Removing ~/.bashrc"
rm ~/.bashrc
echo "Copying TearFree Xorg config"
cp 20-intel.conf /etc/X11/xorg.conf.d
echo "Installing packages"
sudo apt install xorg feh stow i3 tmux firefox vim network-manager -y
echo "Stowing configs"
stow Backgrounds Xorg-tp bash-tp i3 scripts tmux vim
echo "Git config"
git config --global user.name "Larkin Nickle"
git config --global user.email "me@larbob.org"
git config --global credential.helper store
