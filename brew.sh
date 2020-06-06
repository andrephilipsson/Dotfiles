#!/usr/bin/env bash

# Install macos applications and tools using homebrew

# Update brew
brew update

# Turn off analytics
brew analytics off

# Upgrade already installed formulae
brew upgrade

# Tap into other repositories
brew tap homebrew/homebrew-cask-versions

# Install formulae
brew install docker
brew install git
brew install github/gh/gh
brew install gnupg
brew install grep
brew install htop
brew install kotlin
brew install less
brew install mat2
brew install neovim
brew install node
brew install openjdk@11
brew install pandoc
brew install python3
brew install ranger
brew install ssh-copy-id
brew install svtplay-dl
brew install tmux
brew install tree
brew install vim
brew install watchman
brew install wget
brew install youtube-dl
brew install zsh

# Install casks
brew cask install android-platform-tools
brew cask install android-studio
brew cask install balenaetcher
brew cask install brave-browser
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install geogebra
brew cask install gimp
brew cask install inkscape
brew cask install iterm2
brew cask install keepassxc
brew cask install libreoffice
brew cask install lulu
brew cask install mactex-no-gui
brew cask install quicksilver
brew cask install rectangle
brew cask install sdformatter
brew cask install signal
brew cask install tor-browser
brew cask install veracrypt
brew cask install wireshark

# Install fonts
brew cask install font-source-code-pro

# Remove outdated formulae
brew cleanup -s
