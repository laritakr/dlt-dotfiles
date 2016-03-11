#!/bin/bash

if [ -d "$HOME" ]; then
  dotfiles_dir="$( cd "$( dirname "$0" )" && pwd )"

  echo 'Creating symlinks for local dotfiles ...'
  cd "$HOME"
  ln -nsf "$dotfiles_dir/aliases.local" .aliases.local
  ln -nsf "$dotfiles_dir/gitconfig.local" .gitconfig.local
  ln -nsf "$dotfiles_dir/laptop.local" .laptop.local
  ln -nsf "$dotfiles_dir/zshrc.local" .zshrc.local

  if [ -d "$HOME/.bundle" ]; then
    echo "$HOME/.bundle directory exists"
  else
    echo "Creating $HOME/.bundle directory"
    mkdir "$HOME/.bundle"
  fi
  ln -nsf "$dotfiles_dir/bundle/config" .bundle/config

  # Example ~/.gitconfig.name
  #
  # [user]
  #   name  = Dan Brubaker Horst
  #   email = dan.brubaker.horst@gmail.com

  git_user_file="$HOME/.gitconfig.user"

  if [ -f "$git_user_file" ]; then
    echo "$git_user_file already present"
  else
    echo "Recording identity for git commits in $git_user_file"
    read -rp 'Preferred name: ' git_username
    read -rp 'Email address: ' git_email
    printf "[user]%s\n  name  = $git_username%s\n  email = $git_email" > "$git_user_file"
  fi
else
  echo "Cannot locate home directory for $(whoami)"
fi
