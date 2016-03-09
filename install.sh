#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ -d "$HOME" ]; then
  echo 'Creating symlinks for local dotfiles ...'
  cd "$HOME"
  ln -nsf "$DOTFILES_DIR/aliases.local" .aliases.local
  ln -nsf "$DOTFILES_DIR/bundle" .bundle
  ln -nsf "$DOTFILES_DIR/gitconfig.local" .gitconfig.local
  ln -nsf "$DOTFILES_DIR/laptop.local" .laptop.local
  ln -nsf "$DOTFILES_DIR/zshrc.local" .zshrc.local
else
  echo "Cannot locate home directory for $(whoami)"
fi

# Example ~/.gitconfig.name
#
# [user]
#   name  = Dan Brubaker Horst
#   email = dan.brubaker.horst@gmail.com

if [ -f "$HOME/.gitconfig.name" ]; then
  echo '~/.gitconfig.name already present'
else
  echo 'Recording information for git commits in ~/.gitconfig.name'
  read -rp 'Preferred name: ' git_username
  read -rp 'Email address: ' git_email
  printf "[user]%s\n  name  = $git_username%s\n  email = $git_email" > "$HOME/.gitconfig.name"
fi
