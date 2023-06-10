#!/bin/sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Dock
defaults write com.apple.dock "tilesize" -int "64"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "genie"

killall Dock

# Screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "include-date" -bool "true"
defaults write com.apple.screencapture "location" -string "~/Pictures"
defaults write com.apple.screencapture "show-thumbnail" -bool "true"
defaults write com.apple.screencapture "type" -string "png"

killall SystemUIServer

# Finder
defaults write com.apple.finder "QuitMenuItem" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "true"
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2"

killall Finder

# Desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
defaults write com.apple.finder "CreateDesktop" -bool "true"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"

killall Finder

# Menu bar
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm\""

killall SystemUIServer

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false"

killall Dock

# Feedback Assistant
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

# Simulator
defaults write com.apple.iphonesimulator "ScreenShotSaveLocation" -string "~/Pictures/Simulator Screenshots"

# Text Edit
defaults write com.apple.TextEdit "RichText" -bool "false"

killall TextEdit

# Time Machine
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# Activity Monitor
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "2"
defaults write com.apple.ActivityMonitor "IconType" -int "5"

killall Activity\ Monitor

# Music
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false"

killall Music

# Keyboard
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
defaults write NSGlobalDomain "KeyRepeat" -int "1"
defaults write NSGlobalDomain "InitialKeyRepeat" -int "10"
