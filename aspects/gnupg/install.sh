#!/bin/sh

[ ! -d "$HOME/.gnupg" ] && mkdir ~/.gnupg

if ! [ -e $HOME/.gnupg/gpg-agent.conf ]; then
  ln -sf $(pwd)/files/gpg-agent.confg ~/.gnupg/gpg-agent.conf
  echo "Symlinked gnupg config files to ~/.gnupg"
else
  echo "Gnupg config files already exist in ~/.gnupg"
fi
