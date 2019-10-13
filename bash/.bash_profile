# .bash_profile

PLAN9=/usr/local/plan9
export PATH=$PATH:$HOME/.local/bin:$PLAN9/bin
[ -f $HOME/.specificrc ] && . $HOME/.specificrc
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
