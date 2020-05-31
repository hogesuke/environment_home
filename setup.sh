#!/usr/bin/env bash

set -eu

#
# macOS settings
#

# Global

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

# Finder

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Menubar

# バッテリーのパーセントを表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# Dock

# サイズ
defaults write com.apple.dock tilesize -int 41
# 自動的に隠す
defaults write com.apple.dock autohide -bool true
killall Dock

# Trackpad

# タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# 軌跡の速さ
defaults write -g com.apple.trackpad.scaling 2

#
# brew
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew install
brew install git hub jq peco zsh colordiff coreutils openssl mysql cask

# cask install
brew cask install visual-studio-code google-chrome firefox dropbox \
                  alfred google-japanese-ime karabiner-elements bartender \
                  clipy docker iterm2 simplecap

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
