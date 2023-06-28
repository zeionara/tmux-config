#!/bin/bash

echo 'Checking if tmux is already installed...'

tmux -V && echo 'Tmux is already installed, proceeding to the configuration...' || echo 'Installing tmux...' && sudo apt-get update && sudo apt-get install tmux

echo 'Installing widget dependencies...'

sudo apt-get update && sudo apt-get install gawk net-tools coreutils -y

echo 'Getting tmux config repo...'

git clone https://github.com/zeionara/tmux-config.git $HOME/tmux-config

echo 'Installing tmux config...'

$HOME/tmux-config/install.sh
