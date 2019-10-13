xrdb -merge ~/.Xresources
[ -f $HOME/.specificxrc ] && . $HOME/.specificxrc
compton &
exec i3
