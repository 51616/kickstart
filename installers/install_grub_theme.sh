#!/bin/bash
cd ~
git clone https://github.com/catppuccin/grub.git && cd grub
sudo mkdir -p /usr/share/grub/themes/
sudo cp -r src/* /usr/share/grub/themes/
echo -e '\nGRUB_THEME="/usr/share/grub/themes/catppuccin-macchiato-grub-theme/theme.txt"\n' \
| sudo tee -a /etc/default/grub > /dev/null
sudo grub-mkconfig -o /boot/grub/grub.cfg
cd ~
rm -rf grub

