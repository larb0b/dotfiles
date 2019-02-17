# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PLAN9=/usr/local/plan9
export PATH=$PATH:$HOME/.local/bin:/usr/local/plan9/bin
alias man="man -m /usr/local/plan9/man"
