#!/bin/sh

if [ -x $(which brew) ] ; then
  echo "Homebrew is already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle install --file=./files/Brewfile
