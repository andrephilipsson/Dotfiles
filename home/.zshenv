#!/bin/zsh

# Runs on login. Environmental variables are set here.

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export DOTFILES_DIR="$HOME/Code/personal/dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export R_ENVIRON_USER="$XDG_CONFIG_HOME/R/Renviron"
export ANDROID_HOME=$HOME/Android/Sdk
export JDTLS="$DOTFILES_DIR/contrib/eclipse.jdt.ls"


# Default programs
export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=alacritty
