#!/bin/bash
set -e
if [ $(id -u) != 0 ]; then
	echo "You must be root to run this script."
	exit 1
fi
mkdir -p ~/.local/bin
mkdir -p ~/Backgrounds
mkdir -p /etc/X11/xorg.conf.d
rm ~/.bashrc
cp 20-intel.conf /etc/X11/xorg.conf.d
sudo apt install xorg feh stow i3 tmux firefox vim network-manager -y
stow Backgrounds Xorg-tp bash-tp i3 scripts tmux vim
