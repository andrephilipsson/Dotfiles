#!/bin/sh

[ ! -d "$HOME/.config" ] && mkdir -p ~/.config

if ! [ -e $HOME/.config/git ]; then
  ln -sf $(pwd)/files ~/.config/git
  echo "Symlinked git config files to ~/.config/git"
else
  echo "Git config files already exist in ~/.config/git"
fi
