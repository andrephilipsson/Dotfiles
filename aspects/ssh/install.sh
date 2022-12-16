#!/bin/sh

if ! [ -e $HOME/.ssh/config ]; then
  ln -sf $(pwd)/files/config ~/.ssh/config
  echo "Symlinked ssh config files to ~/.ssh"
else
  echo "Ssh config files already exist in ~/.ssh"
fi
