#!/bin/sh

DOTFILES_DIR="$( cd "$( dirname "$0" )" && pwd )"
HOME_DIR="/Users/$(whoami)"

if [ -d "$HOME_DIR" ]; then
  echo 'Creating symlinks for local dotfiles ...'
  cd "$HOME_DIR"
  ln -nsf "$DOTFILES_DIR/aliases.local" .aliases.local
  ln -nsf "$DOTFILES_DIR/bundle" .bundle
  ln -nsf "$DOTFILES_DIR/gitconfig.local" .gitconfig.local
  ln -nsf "$DOTFILES_DIR/laptop.local" .laptop.local
  ln -nsf "$DOTFILES_DIR/zshrc.local" .zshrc.local
else
  echo "Cannot locate home directory for $(whoami)"
fi
