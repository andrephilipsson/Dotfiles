#!/bin/sh

if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"

if test $(which brew)
then
  brewfile="$dotfilesDirectory/homebrew/Brewfile"

  if brew bundle check --file="$brewfile" &> /dev/null
  then
    echo "  Brewfile already installed"
  else
    echo "  Installing Brewfile"
    brew bundle --file="$brewfile"
  fi
fi

exit 0
