#!/bin/zsh

# Append to $PATH-like, unless already present.
# If present, moves it to the end.
# See also: prepend_to().
function append_to() {
  local LOCATION=$1
  PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
  PATH=${PATH/#"$LOCATION:"/} # Delete from start.
  PATH=${PATH/%":$LOCATION"/} # Delete from end.
  PATH="${PATH:+$PATH:}$LOCATION" # Actually append (or if PATH is empty, just set).
}

# Prepend to $PATH-like, unless already present.
# If present, moves it to the start.
# See also: append_to().
function prepend_to() {
  local LOCATION=$1
  PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
  PATH=${PATH/#"$LOCATION:"/} # Delete from start.
  PATH=${PATH/%":$LOCATION"/} # Delete from end.
  PATH="$LOCATION${PATH:+:$PATH}" # Actually prepend (or if PATH is empty, just set).
}

if command -v gem &> /dev/null; then
  # Split string at ":".
  # Via: https://unix.stackexchange.com/a/614304
  for GEM_PATH ("${(s[:])$(gem env gempath)}"); do
    test -d "$GEM_PATH/bin" && append_to "$GEM_PATH/bin"
  done
fi

prepend_to /usr/local/bin
prepend_to /usr/local/sbin

append_to "$VOLTA_HOME/bin"
append_to "$DOT/vendor/git-cipher/bin"
append_to "$HOME/Library/Application Support/Coursier/bin"
append_to "$HOME/.pub-cache/bin"

# On ARM Macs, Homebrew will use this instead of /usr/local.
test -d /opt/homebrew/sbin && prepend_to /opt/homebrew/sbin
test -d /opt/homebrew/bin && prepend_to /opt/homebrew/bin

# If you ever want to see this in easy-to-read form: `echo $PATH | tr : '\n'`
export PATH
