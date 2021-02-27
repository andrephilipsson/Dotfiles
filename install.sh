#!/bin/sh

# Ask for sudo password upfront
sudo -v

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
./brew.sh

# Symlink dotfiles
ln -sf ~/Code/dotfiles/.config ~
ln -s ~/Code/dotfiles/bin ~
ln -s ~/Code/dotfiles/.zshenv ~

# Setup macOS settings
./macos

# Setup Neovim
sudo gem install neovim
pip install pynvim

# Compile Command-T plugin
cd ~/Code/dotfiles/.config/nvim/pack/bundle/opt/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make

# Install language servers
pip install "python-language-server[all]"
yarn global add vls tsserver
R -e "install.packages('languageserver')"

nvim -c TSUpdate all -c TSInstall all -c helptags ALL
