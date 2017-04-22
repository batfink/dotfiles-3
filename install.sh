#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles

DOTFILES=(
  gitconfig
  gitignore
  hammerspoon
  hushlogin
  tmux.conf
  tmuxline.conf
  vim
  vimrc
  zshrc
)

for file in "${DOTFILES[@]}"
do
  SOURCE=$DOTFILES_DIR/$file
  DESTINATION=$HOME/.$file
  echo "Symlinking $SOURCE to $DESTINATION"
  ln -sf $DOTFILES_DIR/$file $HOME/.$file
done

