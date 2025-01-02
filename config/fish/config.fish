set fish_greeting ""

set -x HOMEBREW_NO_ANALYTICS 1

alias cat="bat"
alias e="exit"
alias g="git"
alias l="ls -l"
alias ll="ls -la"
alias ls="eza"
alias t="tmux"

fish_add_path "$HOME/Developer/dotfiles/bin"
fish_add_path "/opt/homebrew/bin"

# Always activate the default flox environment
flox activate -m run -d $HOME | source

# Load 1Password CLI plugins
source $HOME/.config/op/plugins.sh

if status is-interactive
    # Load Ghostty's shell integration in sub-shells, e.g. when running `flox activate`
    if test -n "$GHOSTTY_RESOURCES_DIR"
        source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
end
