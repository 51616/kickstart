#!/bin/bash
# pipx and rich-cli
# for ubuntu 18
# sudo apt-get install python3.8 python3-pip python3.8-venv -y
# python3.8 -m pip install --user pipx
# python3.8 -m pipx ensurepath
# python3.8 -m pipx install rich-cli
# python3.8 -m pipx inject rich-cli Pygments

# for ubuntu 20-22
# python3 -m pip install --user pipx
# python3 -m pipx ensurepath

sudo apt update
sudo apt install pipx
pipx ensurepath
pipx install rich-cli
pipx install gdown
pipx install tldr
pipx install yt-dlp
