#!/bin/zsh

# Runs on login. Environmental variables are set here.

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export R_ENVIRON_USER="$XDG_CONFIG_HOME/R/Renviron"

# Default programs
export EDITOR=nvim
export TERMINAL=alacritty

export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
