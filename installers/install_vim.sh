#!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
ln -s /opt/nvim/nvim ~/.local/bin/nvim

# just use bare nvchad config
rm -rf ~/.local/share/nvim/
rm -rf ~/.config/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim/ --depth 1 && /opt/nvim/nvim
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.github
rm -rf ~/.config/nvim/.gitignore
