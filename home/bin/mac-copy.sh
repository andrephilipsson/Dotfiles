#!/bin/sh

ACTIVE_WINDOW=$(xdotool getactivewindow)
ALACRITTY_WINDOWS=$(xdotool search --class Alacritty)

if [ -n "${ACTIVE_WINDOW}" ]; then
  if [[ "${ALACRITTY_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
    xdotool key --delay 0 --clearmodifiers ctrl+shift+c
  else
    xdotool key --delay 0 --clearmodifiers ctrl+c
  fi
fi
