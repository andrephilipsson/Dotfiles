# Aliases
alias lock="dm-tool switch-to-greeter"
alias vim="nvim"
alias v="nvim"
alias g="git"
alias ls="ls -F"
alias ll="ls -lF"
alias la="ls -laF"

setopt autocd		# Automatically cd into typed directory.

# Prompt
export PS1="[%n@%m]%(!.#.$) "

source $HOME/dotfiles/.config/zsh/path

# Base16 Shell
export BASE16_SHELL_SET_BACKGROUND=false
BASE16_SHELL="$HOME/.config/zsh/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Syntax highlighting
source ~/dotfiles/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
