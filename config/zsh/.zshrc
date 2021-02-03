#!/bin/zsh

# Source other files
source $XDG_CONFIG_HOME/zsh/aliases

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

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ":vcs_info:*" enable git hg
zstyle ":vcs_info:*" check-for-changes true
zstyle ":vcs_info:*" stagedstr "%F{green}●%f"
zstyle ":vcs_info:*" unstagedstr "%F{red}●%f"
zstyle ":vcs_info:*" use-simple true
zstyle ":vcs_info:git+set-message:*" hooks git-untracked
zstyle ":vcs_info:git*:*" formats "[%b%m%c%u] "
zstyle ":vcs_info:git*:*" actionformats "[%b|%a%m%c%u] "

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}●%f"
  fi
}

RPROMPT="\${vcs_info_msg_0_}%F{blue}%~%f"
export PS1="%b%F{blue}%B%1~%b%F{yellow}%B%(1j.*.)%(?..!)%b%f %F{red}➜ %f"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"


source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^t' autosuggest-accept

# Syntax highlighting should be last
source $XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
