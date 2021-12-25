#!/bin/zsh

# Most of these are stolen from:
# https://github.com/wincent/wincent/blob/master/aspects/dotfiles/files/.zsh/functions

# function tmux() {
#   emulate -L zsh

#   # If provided with args, pass them through.
#   if [[ -n "$@" ]]; then
#     tmux "$@"
#     return
#   fi

#   # Check for .tmux file
#   if [ -x .tmux ]; then
#     # Prompt the first time we see a given .tmux file before running it.
#     local DIGEST="$(openssl sha512 .tmux)"
#     if ! grep -q "$DIGEST" $XDG_CACHE_HOME/tmux.digests 2> /dev/null; then
#       cat .tmux
#       read -k 1 -r \
#         'REPLY?Trust (and run) this .tmux file? (t = trust, otherwise = skip) '
#       echo
#       if [[ $REPLY =~ ^[Tt]$ ]]; then
#         echo "$DIGEST" >> $XDG_CACHE_HOME/tmux.digests
#         ./.tmux
#         return
#       fi
#     else
#       ./.tmux
#       return
#     fi
#   fi

#   # Attach to existing session, or create one, based on current directory.
#   local SESSION_NAME=$(basename "${$(pwd)//[.:]/_}")
#   env SSH_AUTH_SOCK=$SOCK_SYMLINK tmux new -A -s "$SESSION_NAME"
# }

function scratch() {
  local SCRATCH=$(mktemp -d)
  echo 'Spawing subshell in scratch directory:'
  echo "  $SCRATCH"
  (cd $SCRATCH; zsh)
  echo "Removing scratch directory"
  rm -rf "$SCRATCH"
}

function tmux_session() {
  if [[ $# -eq 1 ]]; then
    dir=$1
  else
    return
  fi

  dir_name=$(basename "$dir")

  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $dir_name -c $dir
    return
  fi

  if ! tmux has-session -t $dir_name 2> /dev/null; then
    tmux new-session -ds $dir_name -c $dir
  fi

  if [[ -z $TMUX ]]; then
    tmux attach-session -t $dir_name
  else
    tmux switch-client -t $dir_name
  fi
}

function fd() {
  local DIR
  DIR=$(bfs ~/Code/work ~/Code/personal ~/Code/school -mindepth 1 -maxdepth 1 -type d 2> /dev/null | sk --no-multi --preview='test -n "{}" && ls {}' -q "$*")

  tmux_session $DIR
}

# Convenience function for jumping to hashed directory aliases
# (ie. `j rn` -> `jump rn` -> `cd ~rn`).
function jump() {
  emulate -L zsh

  if [ $# -eq 0 ]; then
    fd
  else
    local DIR="${*%%/}"

    if [ $(hash -d|cut -d= -f1 | grep -c "^${DIR}\$") = 0 ]; then
      # Not in `hash -d`: use as initial argument to fd.
      fd "$*"
    else
      tmux_session ~$DIR
    fi
  fi
}

function _jump_complete() {
  emulate -L zsh

  local COMPLETIONS
  COMPLETIONS="$(hash -d|cut -d= -f1)"
  reply=( "${(ps:\n:)COMPLETIONS}" )
}

# Complete filenames and `hash -d` entries.
compctl -f -K _jump_complete jump
