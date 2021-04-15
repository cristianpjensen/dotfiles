#!/bin/zsh
set -ex

#
# macOS defaults
#

chflags nohidden ~/Library

# finder
# show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# dock
# autohide delay
defaults write com.apple.dock autohide-delay -float 0 && killall Dock

# automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# disable bounce
defaults write com.apple.dock no-bouncing -bool false

# dock size
defaults write com.apple.dock tilesize -int 38

# other
# auto software update schedule
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# screencapture image type
defaults write com.apple.screencapture type PNG

# dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark


# apply changes
killall Finder
killall Dock
killall cfprefsd
killall SystemUIServer
