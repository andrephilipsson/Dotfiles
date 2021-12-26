#!/usr/bin/env bash

# See https://macos-defaults.com/

################################################################################

# Keyboard

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain "KeyRepeat" -int 1
defaults write NSGlobalDomain "InitialKeyRepeat" -int 10

################################################################################

# Dock

# Show the dock on the left side of the screen (default: bottom)
defaults write com.apple.dock "orientation" -string left

# Make icons in dock smaller (default: 48)
defaults write com.apple.dock "tilesize" -int 30

# Autohide the dock (default: false)
defaults write com.apple.dock "autohide" -bool true

# Remove autohide animation time (default: 0.5)
defaults write com.apple.dock "autohide-time-modifier" -float 0

# Remove autohide delay (default: 0.5)
defaults write com.apple.dock "autohide-delay" -float 0

# Don't show recently used applications in dock (default: true)
defaults write com.apple.dock "show-recents" -bool false

# Minimize animation effect (default: genie)
defaults write com.apple.dock "mineffect" -string genie

killall Dock

################################################################################

# Screenshots

# Disable shadow (default: false)
defaults write com.apple.screencapture "disable-shadow" -bool true

# Include date and time in file names
defaults write com.apple.screencapture "include-date" -bool true

# Save screenshots in ~/Pictures (default: ~/Desktop)
defaults write com.apple.screencapture "location" -string ~/Pictures

# Don't show thumbnail after taking a screenshot (default: true)
defaults write com.apple.screencapture "show-thumbnail" -bool false

# Save screenshots as jpg (default: png)
defaults write com.apple.screencapture "type" -string jpg

killall SystemUIServer

################################################################################

# Finder

# Make it possible to quit Finder (default: false)
defaults write com.apple.finder "QuitMenuItem" -bool true

# Show all filename extensions (default: false)
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true

# Hide hidden files by default (default: false)
defaults write com.apple.Finder "AppleShowAllFiles" -bool false

# Don't show a warning when changing file extensions (default: true)
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false

# Don't save new documents to iCloud (default: true)
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false

# Remove toolbar title hover delay (default: 0.5)
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float 0

# Sidebar icon size (default: 2)
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int 2

killall Finder
