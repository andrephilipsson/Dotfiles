
source $HOME/Projects/dotfiles/config/zsh/aliases
source $HOME/Projects/dotfiles/config/zsh/path

export HISTSIZE=100000
export HISTFILE=~/.cache/zsh/history
export SAVEHIST=$HISTSIZE

bindkey -e # emacs bindings, set to -v for vi bindings

bindkey ' ' magic-space # do history expansion on space

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # [default] don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt IGNORE_EOF              # [default] prevent accidental C-d from exiting shell
setopt INTERACTIVE_COMMENTS    # [default] allow comments, even in interactive shells
setopt LIST_PACKED             # make completion lists more densely packed
setopt MENU_COMPLETE           # auto-insert first possible ambiguous completion
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
setopt PRINT_EXIT_VALUE        # [default] for non-zero exit status
setopt SHARE_HISTORY           # share history across shells

compinit -d ~/.cache/zsh/zcompdump

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

# Syntax highlighting
source $HOME/Projects/dotfiles/config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
