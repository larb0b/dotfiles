# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
PLAN9=/usr/local/plan9
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/torbrowser:$PLAN9/bin
function setbg {
        feh --no-fehbg --bg-scale "$(find $HOME/Backgrounds -name "*.good.jpg" | sort -R | sed 1q)"
}
