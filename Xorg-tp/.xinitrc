if xrandr | grep "VGA1 connected"; then
	xrandr --output VGA1 --auto --left-of LVDS1
fi
xinput --set-prop 11 "libinput Accel Speed" -0.75
feh --randomize --bg-fill /home/larbob/Backgrounds/*.good.jpg
compton &
exec i3
