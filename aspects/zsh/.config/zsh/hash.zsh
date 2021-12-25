#!/bin/zsh

local DOTFILES=$DOT
local CODE=~/code

test -d $CODE && hash -d code=$CODE
test -d $DOTFILES && hash -d dot=$DOTFILES
