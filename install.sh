#!/bin/bash

echo "Installing scratchpad..."
# Check dependencies
DEP_CHECK(){
  echo "Checking for neovim..."
  if ! [[ "$(command -v nvim)" ]];
  then
    echo "I need nvim or vim to work! Neovim not found, checking for vim..."
  elif ! [[ "$(command -v nvim)" ]]; then
    echo "Vim not found! Please install either vim or neovim.  Aborting."
    exit 1
  else
    echo "Dependency check OK."
    INSTALLER
  fi
}

INSTALLER(){
  install -v scratchpad $HOME/bin/
  exit 0
}

INIT(){
  DEP_CHECK
}
INIT
