# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
PLAN9=/usr/local/plan9
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/torbrowser:$PLAN9/bin
function setbg {
	feh --bg-fill /home/larbob/Backgrounds/howl.good.jpg
}
function mon {
	if [ "$1" == "l" ]; then
		xrandr --output VGA1 --auto --left-of LVDS1
		setbg
	elif [ "$1" == "r" ]; then
		xrandr --output VGA1 --auto --right-of LVDS1
		setbg
	elif [ "$1" == "o" ]; then
		xrandr --output VGA1 --off
	else 
		echo "Arguments: l for monitor to the left, r for monitor to the right, o to turn off secondary monitor."
	fi
}
function streamer {
	youtube-dl -o - "$1" | vlc -
}
