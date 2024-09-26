#
# Autoloaded functions
#

fpath=($HOME/.config/zsh/functions.d $fpath)

autoload -Uz history
autoload -Uz jump
autoload -Uz fd
autoload -Uz fh
autoload -Uz git
autoload -Uz scratch

#
# Exports
#

export GOPATH=$HOME/.go
export CORRECT_IGNORE_FILE='.*'
export HOMEBREW_NO_ANALYTICS=1

PATH="$GOPATH/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="$HOME/Developer/dotfiles/bin:$PATH"
PATH=".:$PATH"
export PATH

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

#
# Options
#

setopt AUTO_CD                  # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH         # tab completing directory appends a slash
setopt AUTO_PUSHD               # [default] cd automatically pushes old dir onto dir stack
setopt CORRECT                  # [default] command auto-correction
setopt CORRECT_ALL              # [default] argument auto-correction
setopt EXTENDED_HISTORY         # save timestamps with history
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicate entries first when trimming history
setopt HIST_FIND_NO_DUPS        # don't show dupes when searching
setopt HIST_IGNORE_DUPS         # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE        # [default] don't record commands starting with a space
setopt HIST_SAVE_NO_DUPS        # don't write duplicate entries in history file
setopt HIST_VERIFY              # confirm history expansion (!$, !!, !foo)
setopt IGNORE_EOF               # [default] prevent accidental C-d from exiting shell
setopt INC_APPEND_HISTORY       # immediately append to history file
setopt INTERACTIVE_COMMENTS     # [default] allow comments, even in interactive shells
setopt LIST_PACKED              # make completion lists more densely packed
setopt MENU_COMPLETE            # auto-insert first possible ambiguous completion
setopt NO_NOMATCH               # [default] unmatched patterns are left unchanged
setopt PRINT_EXIT_VALUE         # [default] for non-zero exit status
setopt PUSHD_IGNORE_DUPS        # don't push multiple copies of same dir onto stack
setopt PUSHD_SILENT             # [default] don't print dir stack after pushing/popping
setopt SHARE_HISTORY            # share history across shells

#
# Aliases
#

alias e="exit"
alias g="git"
alias ls="eza"
alias ll="ls -la"
alias l="ls -l"
alias cat="bat"
alias find="command fd"

#
# Bindings
#

bindkey -e # emacs bindings, set to -v for vi bindings

# Use "cbt" capability ("back_tab", as per `man terminfo`), if we have it:
if tput cbt &> /dev/null; then
  bindkey "$(tput cbt)" reverse-menu-complete # make Shift-tab go to previous completion
fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line

bindkey ' ' magic-space # do history expansion on space

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# CTRL-R - Paste the selected command from history into the command line
skim-history-widget() {
  local selected=$(fc -l 1 | sk --no-multi --tac --no-sort -q "$*" -p "❯ " | sed 's/ *[0-9]*\*\{0,1\} *//')
  if [ -n "$selected" ]; then
    LBUFFER="$selected"
    zle reset-prompt
  fi
}
zle -N skim-history-widget
bindkey '^r' skim-history-widget

source /Users/andre/.config/op/plugins.sh

if [ -n "$TTY" ]; then
  export GPG_TTY=$TTY
else
  export GPG_TTY=$(tty)
fi

eval "$(flox activate --dir $HOME)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# Hooks
#

autoload -U add-zsh-hook

function -auto-ls-after-cd() {
  emulate -L zsh
  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
  # function).
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls -a
  fi
}
add-zsh-hook chpwd -auto-ls-after-cd
