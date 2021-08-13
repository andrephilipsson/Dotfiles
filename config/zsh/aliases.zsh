#!/bin/zsh

alias v="nvim"
alias j="jump"
alias g="git"
alias ls="ls -hFG"
alias l="ls -hFG"
alias ll="ls -lAhFG"
alias week="date +%V"
alias R="R --quiet"
alias e="exit"
alias f="find -name"
alias t="tmux"
alias path="echo -e ${PATH//:/\\n}" # Pretty print path
alias tree="tree -I node_modules"
alias scala3="scala3-repl"

# Suffix aliases
# (eg. "foo.md" to open Markdown files in glow)
alias -s md=glow
