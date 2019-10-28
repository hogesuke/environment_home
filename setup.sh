#!/usr/bin/env bash

set -eu

#
# brew
#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# basic
brew install git jq peco zsh colordiff coreutils

# ricty
brew tap sanemat/font
brew install ricty --with-powerline

cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

#
# zsh
#
chsh -s /usr/local/bin/zsh
