xrdb -merge ~/.Xresources
if xrandr | grep "VGA1 connected"; then
	xrandr --output VGA1 --auto --left-of LVDS1
fi
feh --no-fehbg --bg-scale "$(find $HOME/Backgrounds -name "*.good.jpg" | sort -R | sed 1q)"
compton &
exec i3
