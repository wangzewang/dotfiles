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

backup() {
  info 'Backup dotfiles begin'
  info "-------------------------------"
  info 'Backup brew'

  rm -f Brewfile
  brew bundle dump
  for key in ${!mapping[@]}
  do
      info "-------------------------------"
      info "Copy ${mapping[${key}]} to $key"
      # make sure dir exists
      mkdir -p $(dirname ${key})
      cp ${mapping[${key}]} $DOTFILES_ROOT/$key
  done
  info "-------------------------------"
  info "Backup dotfiles finished"
  info "-------------------------------"

  success "Backup complate!"
}

backup
