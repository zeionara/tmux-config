#!/bin/bash

echop () {
    echo "🚩 $@"
}

echo '🏁 Installing tmux. Checking if it is already installed...'

if test -z $(which tmux); then
    echop 'Installing tmux...'
    sudo apt-get update
    sudo apt-get install tmux -y || true
else
    echop 'Found existing tmux installation'
fi

echop 'Installing widget dependencies...'

sudo apt-get update && sudo apt-get install gawk net-tools coreutils -y

echop 'Getting tmux config repo...'

git clone https://github.com/zeionara/tmux-config.git $HOME/tmux-config

echop 'Installing tmux config...'

$HOME/tmux-config/install.sh
