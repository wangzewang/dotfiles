#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

source $DOTFILES_ROOT/tools/dot_configs.sh

echo "$DOTFILES_ROOT"

set -e

info () {
  printf "\r  [ \033[00;34minfo\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_dotfiles () {
  info 'Installing dotfiles begin'
  for key in ${!mapping[@]}
  do
      info "-------------------------------"
      info "Copy $key to ${mapping[${key}]}"
      # make sure dir exists
      mkdir -p $(dirname \"${mapping[${key}]}\")
      cp $DOTFILES_ROOT/$key ${mapping[${key}]}
  done
  info "-------------------------------"
  info "Installing dotfiles finished"
  info "-------------------------------"

  success "Install complate!"
}

install_dotfiles
