#!/bin/bash
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git --upgrade -y
sudo apt install tree wget zip cmake build-essential htop net-tools -y
sudo apt install zsh tmux curl openssh-server sshfs gpg jq python3 shellcheck -y
sudo apt install ffmpeg openmpi-bin openmpi-common openmpi-doc libopenmpi-dev -y
sudo apt install libfreetype6-dev libevent-dev ncurses-dev bison pkg-config -y
sudo apt install libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev libfuse2 -y
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
