#!/bin/sh

# Make sure we use the latest version of brew
brew update

# Turn of analytics
brew analytics off

brew install docker
brew install firebase-cli
brew install gh
brew install git
brew install gnupg
brew install gradle
brew install grep
brew install htop
brew install kotlin
brew install less
brew install lf
brew install mat2
brew install neovim --HEAD
brew install node
brew install openjdk@11
brew install pandoc
brew install r
brew install sbt
brew install scala
brew install sk
brew install ssh-copy-id
brew install svtplay-dl
brew install tavianator/tap/bfs
brew install texlab
brew install tmux
brew install tree
brew install vim
brew install watchman
brew install webp
brew install wget
brew install yarn
brew install youtube-dl
brew install zsh
brew install zsh-completions

brew install --cask alacritty
brew install --cask android-studio
brew install --cask balenaetcher
brew install --cask brave-browser
brew install --cask firefox
brew install --cask firefox-developer-edition
brew install --cask font-source-code-pro
brew install --cask google-cloud-sdk
brew install --cask keepassxc
brew install --cask libreoffice
brew install --cask mactex-no-gui
brew install --cask rectangle
brew install --cask sdformatter
brew install --cask signal
brew install --cask spotify
brew install --cask veracrypt
brew install --cask vlc

# Remove outdated packages
brew cleanup
