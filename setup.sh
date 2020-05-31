#!/usr/bin/env bash

set -eu

#
# macOS settings
#
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

#
# brew
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew install
brew install git hub jq peco zsh colordiff coreutils openssl mysql cask

# cask install
brew cask install visual-studio-code firefox dropbox alfred google-japanese-ime karabiner-elements bartender

# ricty
#
# FIXME: 2020-05-30 インストール時にエラーが発生するためコメントアウト
# 参考: https://qiita.com/tororu/items/60be4385853860c05fad
#
# brew tap sanemat/font
# brew install ricty --with-powerline
# cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
# fc-cache -vf

#
# anyenv
#
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
mkdir -p ~/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
anyenv install --force-init
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv

#
# zsh
#
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
# FIXME: プライベートリポジトリだから鍵をPCのローカルに置かないとgit cloneできない
# git clone git@github.com:hogesuke/dotfiles_home.git ~/dotfiles_home
# bash ~/dotfiles_home/link.sh
