# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
[ "$TERM" != "dumb" ] && PS1="\[\e[1;36m\][\[\e[m\]\[\e[1;35m\]\u\[\e[m\]\[\e[1;36m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;36m\]\W\[\e[m\]\[\e[1;36m\]]\[\e[m\]\[\e[m\] "
[ "$(tty)" = "/dev/tty1" ] && exec startx
if [ "$TERM" != "linux" ] && [ "$TERM" != "dumb" ]; then
	[ "x$TMUX" == "x" ] && tmux
fi
