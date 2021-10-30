#!/bin/zsh

local DOT=~/Code/personal/dotfiles
local CODE=~/Code

test -d "$CODE" && hash -d code="$CODE"
test -d "$DOT" && hash -d dot="$DOT"
