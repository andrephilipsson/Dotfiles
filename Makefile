UNAME := $(shell uname)
DOTFILE_PATH := $(shell pwd)
HOME_PATH := $(shell echo $$HOME)

# Find all files in the home directory
HOME_FILES := $(shell find home -type f)

# Find all files in the config directory
CONFIG_FILES := $(shell find config -type f)

.PHONY: all home config

all: home config

home:
	@echo "Symlinking home files..."
	@for file in $(HOME_FILES); do \
		target=$(HOME_PATH)/$$(echo $$file | sed 's|home/||'); \
		echo "Linking $$file to $$target"; \
		ln -sf $(DOTFILE_PATH)/$$file $$target; \
	done

config:
	@echo "Symlinking config files..."
	@for file in $(CONFIG_FILES); do \
		target=$(HOME_PATH)/.config/$$(echo $$file | sed 's|config/||'); \
		echo "Linking $$file to $$target"; \
		mkdir -p $$(dirname $$target); \
		ln -sf $(DOTFILE_PATH)/$$file $$target; \
	done

setup-homebrew:
	@echo "Checking if Homebrew is installed..."
	@which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew-install:
	@echo "Installing Homebrew packages..."
	@brew bundle --file=homebrew/Brewfile

brew-cleanup:
	@echo "Cleaning up Homebrew..."
	@brew bundle --force cleanup --file=homebrew/Brewfile
