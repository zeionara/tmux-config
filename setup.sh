#!/bin/bash

set -e

echop () {
    echo "🚩 $@"
}

echo '🏁 Installing tmux. Checking if it is already installed...'

if test -z $(which tmux); then
  echop 'Installing tmux...'

  if test $(which apt-get 2> /dev/null); then
    sudo apt-get update
    sudo apt-get install tmux -y || true

    echop 'Installing widget dependencies...'

    sudo apt-get install gawk net-tools coreutils -y
  elif test $(which pacman 2> /dev/null); then
    sudo pacman -Syu
    sudo pacman -S tmux
  elif test $(which emerge 2> /dev/null); then
    sudo emerge --ask app-misc/tmux
  else
    echo "Can't install tmux"
    exit 1
  fi
else
  echop 'Found an existing tmux installation'
fi

echop 'Getting tmux config repo...'

ROOT="$HOME/tmux-config"

git clone https://github.com/zeionara/tmux-config.git "$ROOT"

echop 'Installing tmux config...'

source "$ROOT/install.sh"
