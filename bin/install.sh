#!/bin/sh

# Ask for sudo password upfront
sudo -v

# Update already installed packages and remove unnecessary
sudo apt update
sudo apt upgrade
sudo apt autoremove -y

# Install packages
sudo apt install -y \
	autoconf \
	automake \
	cmake \
	g++ \
	gettext \
	keepassxc
	libtool \
	libtool-bin \
	ninja-build \
	pkg-config \
	unzip \

# Install Github-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y gh

# Create directories
mkdir Projects
mkdir Passwords

# Install and build neovim from source
cd Projects
gh repo clone neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# Symlink dotfiles
# TODO
