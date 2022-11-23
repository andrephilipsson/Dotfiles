# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export VOLTA_HOME="$XDG_DATA_HOME"/volta
export BUN_INSTALL="$HOME/.bun"

# Custom variables
export DOT="$HOME/code/dotfiles"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# Default programs
export EDITOR=nvim
. "$HOME/.cargo/env"
