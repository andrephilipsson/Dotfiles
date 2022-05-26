#!/bin/zsh


# Most of these are stolen from: https://github.com/wincent/wincent/blob/main/aspects/dotfiles/files/.zsh/functions
function scratch() {
  local SCRATCH=$(mktemp -d)
  echo "Spawing subshell in scratch directory:"
  echo "  $SCRATCH"
  (cd $SCRATCH; zsh)
  echo "Removing scratch directory"
  rm -rf "$SCRATCH"
}

# find in history
function fh() {
  print -z $(fc -l 1 | sk --no-multi --tac -q "$*" | sed 's/ *[0-9]*\*\{0,1\} *//')
}

function tmux_session() {
  if [[ $# -eq 1 ]]; then
    dir=$1
  elif [[ $# -eq 0 ]]; then
    dir=$(pwd)
  else
    echo "Usage: tmux_session [dir]"
    return 1
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
  DIR=$(bfs -type d 2> /dev/null | sk --no-multi --preview='test -n "{}" && ls {}' -q "$*")

  cd $DIR
}

# show history
function history() {
  emulate -L zsh

  # This is a function because Zsh aliases can't take arguments.
  fc -l 1
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
      cd ~$DIR
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

# `git` wrapper:
#
#     - `git` with no arguments = `git status`; run `git help` to show what
#       vanilla `git` without arguments would normally show.
#     - `git root` = `cd` to repo root.
#     - `ROOT=$(git root)` = no args and stdout is not a tty; prints the root.
#     - `git root ARG...` = evals `ARG...` from the root (eg. `git root ls`).
#     - `git ARG...` = behaves just like normal `git` command.
#
function git() {
  if [ $# -eq 0 ]; then
    command git status
  elif [ "$1" = root ]; then
    shift
    local ROOT
    if [ "$(command git rev-parse --is-inside-git-dir 2> /dev/null)" = true ]; then
      if [ "$(command git rev-parse --is-bare-repository)" = true ]; then
        ROOT="$(command git rev-parse --absolute-git-dir)"
      else
        # Note: This is a good-enough, rough heuristic, which ignores
        # the possibility that GIT_DIR might be outside of the worktree;
        # see:
        # https://stackoverflow.com/a/38852055/2103996
        ROOT="$(command git rev-parse --git-dir)/.."
      fi
    else
      # Git 2.13.0 and above:
      ROOT="$(command git rev-parse --show-superproject-working-tree 2> /dev/null)"
      if [ -z "$ROOT" ]; then
        ROOT="$(command git rev-parse --show-toplevel 2> /dev/null)"
      fi
    fi
    if [ -z "$ROOT" ]; then
      ROOT="$PWD"
    fi
    if [ $# -eq 0 ]; then
      if [ -t 1 ]; then
        cd "$ROOT"
      else
        echo "$ROOT"
      fi
    else
      (cd "$ROOT" && eval "$@")
    fi
  else
    command git "$@"
  fi
}

# Pretty print $PATH
function path() {
  echo $PATH | sed "s/\:/\n/g"
}
