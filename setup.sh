#!/bin/bash

tmux -V && echo 'Tmux is already installed, proceeding to the configuration...' || echo 'Installing tmux...' && sudo apt-get update && sudo apt-get install tmux

git clone https://github.com/zeionara/tmux-config.git $HOME/tmux-config
$HOME/tmux-config/install.sh
