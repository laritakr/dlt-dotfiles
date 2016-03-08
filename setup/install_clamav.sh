#!/bin/sh

HOMEBREW_DIR="$( brew --prefix )"

if [ -d "$HOMEBREW_DIR" ]; then
  cd HOMEBREW_DIR || echo "You do not have access to ${HOMEBREW_DIR}"
  git fetch --unshallow
  git co 10d9e6d Library/Formula/clamav.rb
  brew install clamav
  brew pin clamav
else
  echo 'Homebrew not found'
fi
