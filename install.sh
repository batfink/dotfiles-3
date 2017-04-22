#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles

trap "exit" INT

echo "Symlinking dotfiles..."
source $DOTFILES_DIR/symlink.sh

echo "Installing snazzy iterm theme..."
curl -OSL https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/master/Snazzy.itermcolors
open Snazzy.itermcolors
rm -rf Snazzy.itermcolors

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing homebrew packages..."
brew install ag fzf git httpie hub htop jq pass reattach-to-user-namespace tmux vim z zsh

echo "Installing cask packages..."
brew cask install alfred caprine dash flux hammerspoon polymail skitch slack spotify

echo "Installing tmux packages..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins

echo "Installing antibody..."
curl -sL https://git.io/antibody | bash -s

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

echo "Installing vim plugins..."
vim -e +PlugInstall +qall

echo "All done!"
