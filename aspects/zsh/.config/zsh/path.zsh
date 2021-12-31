# Save old default PATH
local OLD_PATH=$PATH

# Reset PATH
unset PATH

# Add our own directories to PATH
PATH="$VOLTA_HOME/bin:$PATH"
PATH="$DOT/vendor/git-cipher/bin:$PATH"
PATH="$HOME/Library/Application Support/Coursier/bin:$PATH"
PATH="$PATH":"$HOME/.pub-cache/bin"

PATH=$PATH:$OLD_PATH

export PATH

# Let homebrew add itself to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
