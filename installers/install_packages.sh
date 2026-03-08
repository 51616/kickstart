#!/bin/bash
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git ca-certificates gnupg curl --upgrade -y
sudo apt install tree wget zip cmake build-essential htop net-tools -y
sudo apt install zsh tmux curl openssh-server sshfs gpg jq python3 shellcheck -y
sudo apt install ffmpeg openmpi-bin openmpi-common openmpi-doc libopenmpi-dev -y
sudo apt install libfreetype6-dev libevent-dev ncurses-dev bison pkg-config -y
sudo apt install libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev libfuse2 -y
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# sudo apt-get update && sudo apt-get install google-cloud-cli -y

sudo apt install pipx -y
pipx ensurepath
pipx install rich-cli
pipx install gdown
pipx install tldr
pipx install yt-dlp
source ~/.bashrc
