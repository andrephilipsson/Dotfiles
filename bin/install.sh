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
	default-jre \
	g++ \
	gettext \
	keepassxc
	libtool \
	libtool-bin \
	ninja-build \
	pip3 \
	pipenv \
	pkg-config \
	ruby \
	ruby-dev \
	scala \
	snapd \
	tmux \
	unzip \
	zsh \

# Install Github-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y gh

# Install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt update
sudo apt install sbt

# Install Mark Text
flatpak install flathub com.github.marktext.marktext

# Change shell to zsh
chsh -s $(which zsh)

# Create directories
mkdir Passwords

# Install and build neovim from source
cd ~/Projects
gh repo clone neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# Install provider-ruby for Neovim
sudo gem install neovim

# Install provider-python for Neovim
cd ~/.local/share/
mkdir neovim-virtualenv
cd neovim-virtualenv
pipenv install pynvim
# TODO: Possibly echo path to python executable in the created virtualenv

# Compile Command-t vim-plugin
cd ~/Projects/dotfiles/config/nvim/pack/bundle/opt/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make

# Install python-language-server
pip install "python-language-server[all]"

# Symlink dotfiles
# TODO
