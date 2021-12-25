#!/bin/zsh

# Source other files
source $XDG_CONFIG_HOME/zsh/aliases.zsh
source $XDG_CONFIG_HOME/zsh/functions.zsh
source $XDG_CONFIG_HOME/zsh/hash.zsh
source $XDG_CONFIG_HOME/zsh/path.zsh

export HISTSIZE=100000
export HISTFILE=$XDG_DATA_HOME/zsh/history
export SAVEHIST=$HISTSIZE

bindkey -e # emacs bindings, set to -v for vi bindings

bindkey ' ' magic-space # do history expansion on space

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # [default] don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt INTERACTIVE_COMMENTS    # [default] allow comments, even in interactive shells
setopt LIST_PACKED             # make completion lists more densely packed
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
setopt PRINT_EXIT_VALUE        # [default] for non-zero exit status
setopt SHARE_HISTORY           # share history across shells

autoload -U colors
colors

eval "$(starship init zsh)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Ctrl + t accepts autosuggestion
bindkey "^t" autosuggest-accept

# Plugins. Should be last
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath=("/Users/ape/Library/Application Support/ScalaCli/completions/zsh" $fpath)
