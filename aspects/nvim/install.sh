#!/bin/sh

if ! [ -e $HOME/.config/nvim ]; then
  ln -sf $(pwd)/files ~/.config/nvim
  echo "Symlinked nvim config files to ~/.config/nvim"
else
  echo "nvim config files already exist in ~/.config/nvim"
fi
