#!/bin/bash

function log {
  local LINE="[dotfiles install] $*"
  echo "$LINE"
  echo "${LINE//?/-}"
}

log "Install homebrew"
./brew.sh

log "Install scala"
./install-scala.sh

log "Setup macos settings"
./macos

log "Symlink dotfiles"
./link.sh
