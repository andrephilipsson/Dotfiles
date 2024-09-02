function scratch() {
  local SCRATCH=$(mktemp -d)
  echo 'Spawing subshell in scratch directory:'
  echo "  $SCRATCH"
  (cd $SCRATCH; zsh)
  echo "Removing scratch directory"
  rm -rf "$SCRATCH"
}

export GOPATH=$HOME/go

PATH="$GOPATH/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="$HOME/Library/Application Support/Coursier/bin:$PATH"
PATH="$HOME/Developer/dotfiles/bin:$PATH"
PATH=".:$PATH"
export PATH

setopt AUTO_CD

alias e="exit"
alias g="git"
source /Users/andre/.config/op/plugins.sh
eval "$(fnm env --use-on-cd)"

export GPG_TTY=$(tty) # adds 4ms to startup time
# if [ -n "$TTY" ]; then
#   export GPG_TTY=$TTY
# else
#   export GPG_TTY=$(tty)
# fi

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
