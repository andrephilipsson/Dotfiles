#!/bin/sh

# remaps keyboard
remaps &

# hide mouse pointer if inactive
unclutter &

# set resolution and refresh rate
xrandr --output DP-0 --mode 1920x1080 --rate 144 &

# minimize blue light at night
redshift -l 59.32938:18.06871 &

# start statusbar
dwmblocks &

# start window manager
exec dwm
