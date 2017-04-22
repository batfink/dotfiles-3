#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles
TMP_DIR=$DOTFILES_DIR/.tmp

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

echo "Symlinking dotfiles..."
for file in "${DOTFILES[@]}"
do
  SOURCE=$DOTFILES_DIR/$file
  DESTINATION=$HOME/.$file
  echo "Symlinking $SOURCE/ to $DESTINATION"
  cp -rf $DESTINATION $TMP_DIR/$file 2>/dev/null
  rm -rf $DESTINATION
  ln -sf $DOTFILES_DIR/$file $HOME/.$file
done
