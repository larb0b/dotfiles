# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
PLAN9=/usr/local/plan9
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/torbrowser:$PLAN9/bin
function streamer {
	youtube-dl -o - "$1" | vlc -
}
