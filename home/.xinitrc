#!/bin/sh

# remaps keyboard
remaps &

# hide mouse pointer if inactive
unclutter &

# set resolution and refresh rate
xrandr --output DP-0 --mode 1920x1080 --rate 144 &

# minimize blue light at night
redshift &

# make placerctl target the last used source
playerctld daemon &

xset s 300 5 &
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# start window manager
exec i3
