#!/bin/sh

[ ! -d "$HOME/.config" ] && mkdir -p ~/.config

if ! [ -e $HOME/.config/karabiner ]; then
  ln -sf $(pwd)/files ~/.config/karabiner
  echo "Symlinked karabiner config files to ~/.config/karabiner"
else
  echo "Karabiner config files already exist in ~/.config/karabiner"
fi
