#!/bin/bash

function log {
  local LINE="[brew install] $*"
  echo "$LINE"
  echo "${LINE//?/-}"
}

if ! type "$brew" 2> /dev/null; then
  log "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

log "Installing packages from Brewfile"
brew bundle install --file=./Brewfile

log "Cleaning up brew cache"
brew cleanup
