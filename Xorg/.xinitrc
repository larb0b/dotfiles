xrdb -merge ~/.Xresources
[ -f $HOME/.specificxrc ] && . $HOME/.specificxrc
feh --no-fehbg --bg-scale "$(find $HOME/Backgrounds -name "*.good.jpg" | sort -R | sed 1q)"
compton &
exec i3
