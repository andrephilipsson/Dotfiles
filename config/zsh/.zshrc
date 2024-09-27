#
# Start profiling (uncomment when necessary)
#
# See: https://stackoverflow.com/a/4351664/2103996

# Per-command profiling:

# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i> '
# exec 3>&2 2> startlog.$$
# setopt xtrace prompt_subst

# Per-function profiling:

# zmodload zsh/zprof


#
# Global
#

# Create a hash table for globally stashing variables without polluting main
# scope with a bunch of identifiers.
typeset -A __GLOBAL

__GLOBAL[ITALIC_ON]=$'\e[3m'
__GLOBAL[ITALIC_OFF]=$'\e[23m'

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
autoload -Uz async && async

# Speed up completion init, see: https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

#
# Prompt
#

autoload -U colors
colors

export SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

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

typeset -F SECONDS
function -record-start-time() {
  emulate -L zsh
  ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec -record-start-time

function -update-ps1() {
  # Check for tmux by looking at $TERM, because $TMUX won't be propagated to any
  # nested sudo shells but $TERM will.
  local TMUXING=$([[ "$TERM" =~ "tmux" ]] && echo tmux)
  if [ -n "$TMUXING" -a -n "$TMUX" ]; then
    # In a tmux session created in a non-root or root shell.
    local LVL=$(($SHLVL - 1))
  elif [ -n "$XAUTHORITY" ]; then
    # Probably in X on Linux.
    local LVL=$(($SHLVL - 2))
  else
    # Either in a root shell created inside a non-root tmux session,
    # or not in a tmux session.
    local LVL=$SHLVL
  fi

  # OSC-133 escape sequences for prompt navigation.
  #
  # See: https://gitlab.freedesktop.org/Per_Bothner/specifications/blob/master/proposals/semantic-prompts.md
  #
  # tmux only cares about $PROMPT_START, but we emit other escapes just for
  # completeness (see also, `-mark-output()`, further down).
  local PROMPT_START=$'\e]133;A\e\\'
  local PROMPT_END=$'\e]133;B\e\\'

  # %F{green}, %F{blue}, %F{yellow} etc... = change foreground color
  # %f = turn off foreground color
  # %n = $USER
  # %m = hostname up to first "."
  # %B = bold on, %b = bold off
  local SSH_USER_AND_HOST="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b"

  # %1~ = show 1 trailing component of working directory, or "~" if is is $HOME
  local CURRENT_DIRECTORY="%F{blue}%B%1~%b"

  # Show last `tw` or `tick` step in bold yellow.
  local TW_SUMMARY="%F{yellow}%B(${TW})%b%f"

  # %(1j.*.) = bold yellow "*" if the number of jobs is at least 1
  local JOB_STATUS_INDICATOR="%F{yellow}%B%(1j.*.)%b%f"

  # %(?..!) = bold yellow "!" if the exit status of the last command was not 0
  local EXIT_STATUS_INDICATOR="%F{yellow}%B%(?..!)%b%f"

  local PROMPT_SEPARATOR=" "

  # %(!.%F{yellow}%n%f.) = if root (!) show yellow $USER, otherwise nothing.
  local USER_INDICATOR="%B%(!.%F{yellow}%n%f.)%b"

  # show one ❯ per $LVL
  local PROMPT_CHARACTERS="$(printf '\u276f%.0s' {1..$LVL})"

  # $(!.%F{yellow}.%F{red})$(...) = use bold yellow for root, otherwise bold red
  local FINAL_PROMPT_MARKER="%B%(!.%F{yellow}.%F{red})${PROMPT_CHARACTERS}%f%b"

  PS1="%{${PROMPT_START}%}"
  PS1+="${SSH_USER_AND_HOST}"
  PS1+="${CURRENT_DIRECTORY}"
  if [ -n "$GIT_COMMITTER_DATE" -a -n "$GIT_AUTHOR_DATE" -a -n "$TW" ]; then
    PS1+="${TW_SUMMARY}"
  fi
  PS1+="${JOB_STATUS_INDICATOR}"
  PS1+="${EXIT_STATUS_INDICATOR}"
  PS1+="${PROMPT_SEPARATOR}"
  PS1+="${USER_INDICATOR}"
  PS1+="${FINAL_PROMPT_MARKER}"
  PS1+="%{${PROMPT_END}%}"
  PS1+="${PROMPT_SEPARATOR}"
  export PS1

  if [[ -n "$TMUXING" ]]; then
    # Outside tmux, ZLE_RPROMPT_INDENT ends up eating the space after PS1, and
    # prompt still gets corrupted even if we add an extra space to compensate.
    export ZLE_RPROMPT_INDENT=0
  fi
}
add-zsh-hook precmd -update-ps1

function -mark-output() {
  # Emit OSC 133;C (mark beginning of command output).
  builtin print -n '\e]133;C\e\\'
}
add-zsh-hook preexec -mark-output

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info

() {
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}•%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}•%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:hg*:*' formats '[%m%b] '
zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
zstyle ':vcs_info:hg*:*' branchformat '%b'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:*' get-mq false
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-message:*' hooks hg-message

function +vi-hg-bookmarks() {
    emulate -L zsh
    if [[ -n "${hook_com[hg-active-bookmark]}" ]]; then
    hook_com[hg-bookmark-string]="${(Mj:,:)@}"
    ret=1
    fi
}

function +vi-hg-message() {
    emulate -L zsh

    # Suppress hg branch display if we can display a bookmark instead.
    if [[ -n "${hook_com[misc]}" ]]; then
    hook_com[branch]=''
    fi
    return 0
}

function +vi-git-untracked() {
    emulate -L zsh
    if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}•%f"
    fi
}
}

-start-async-vcs-info-worker() {
async_start_worker vcs_info
async_register_callback vcs_info -async-vcs-info-worker-done
}

-get-vcs-info-in-worker() {
# -q stops chpwd hook from being called:
cd -q $1
vcs_info
print ${vcs_info_msg_0_}
}

-async-vcs-info-worker-done() {
local job=$1
local return_code=$2
local stdout=$3
local more=$6
if [[ $job == '[async]' ]]; then
    if [[ $return_code -eq 1 ]]; then
    # Corrupt worker output.
    return
    elif [[ $return_code -eq 2 || $return_code -eq 3 || $return_code -eq 130 ]]; then
    # 2 = ZLE watcher detected an error on the worker fd.
    # 3 = Response from async_job when worker is missing.
    # 130 = Async worker crashed, this should not happen but it can mean the
    # file descriptor has become corrupt.
    #
    # Restart worker.
    async_stop_worker vcs_info
    -start-async-vcs-info-worker
    return
    fi
fi
vcs_info_msg_0_=$stdout
(( $more )) || zle reset-prompt
}

-clear-vcs-info-on-chpwd() {
vcs_info_msg_0_=
}

-trigger-vcs-info-run-in-worker() {
async_flush_jobs vcs_info
async_job vcs_info -get-vcs-info-in-worker $PWD
}

-start-async-vcs-info-worker
add-zsh-hook precmd -trigger-vcs-info-run-in-worker
add-zsh-hook chpwd -clear-vcs-info-on-chpwd

FLOX_PROMPT=${FLOX_PROMPT_ENVIRONMENTS:+ (${FLOX_PROMPT_ENVIRONMENTS})}

RPROMPT_BASE="\${vcs_info_msg_0_}%F{blue}%~%f\$FLOX_PROMPT"
setopt PROMPT_SUBST

function -update-rprompt() {
  emulate -L zsh
  if [ $ZSH_START_TIME ]; then
    local DELTA=$(($SECONDS - $ZSH_START_TIME))
    local DAYS=$((~~($DELTA / 86400)))
    local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
    local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
    local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
    local ELAPSED=''
    test "$DAYS" != '0' && ELAPSED="${DAYS}d"
    test "$HOURS" != '0' && ELAPSED+="${HOURS}h"
    test "$MINUTES" != '0' && ELAPSED+="${MINUTES}m"
    if [ "$ELAPSED" = '' ]; then
      SECS="$(print -f "%.2f" $SECS)s"
    elif [ "$DAYS" != '0' ]; then
      SECS=''
    else
      SECS="$((~~$SECS))s"
    fi
    ELAPSED+="${SECS}"
    export RPROMPT="%F{cyan}%{$__WINCENT[ITALIC_ON]%}${ELAPSED}%{$__WINCENT[ITALIC_OFF]%}%f $RPROMPT_BASE"
    unset ZSH_START_TIME
  else
    export RPROMPT="$RPROMPT_BASE"
  fi
}
add-zsh-hook precmd -update-rprompt


#
# End profiling (uncomment when necessary)
#

# Per-command profiling:

# unsetopt xtrace
# exec 2>&3 3>&-

# Per-function profiling:

# zprof > /tmp/foo.txt
