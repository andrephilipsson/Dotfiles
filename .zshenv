#!/bin/zsh

# Runs on login. Environmental variables are set here.

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export R_ENVIRON_USER="$XDG_CONFIG_HOME/R/Renviron"

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$XDG_DATA_HOME/gem/bin
export PATH=$PATH:$HOME/.local/bin/statusbar
export PATH="$(yarn global bin):$PATH"
export PATH="$PATH:$XDG_DATA_HOME/kotlin-language-server/server/build/install/server/bin"

# Variables for Java language server
export JAR="/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar"
export GRADLE_HOME="/usr/share/java/gradle/"
export JAVA_HOME="/usr/"
export JDTLS_CONFIG="$XDG_DATA_HOME/jdtls/config_linux"
export WORKSPACE="$XDG_CACHE_HOME/workspace"

# Default programs
export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=alacritty

# Other exports
export XSECURELOCK_SHOW_DATETIME=1
