#!/bin/sh

[ ! -d "$HOME/.config/gh" ] && mkdir -p ~/.config/gh

if ! [ -e $HOME/.config/config.yml ]; then
  ln -sf $(pwd)/files/config.yml ~/.config/gh/config.yml
  echo "Symlinked gh config file to ~/.config/gh/config.yml"
else
  echo "Gh config file already exist in ~/.config/gh/config.yml"
fi
