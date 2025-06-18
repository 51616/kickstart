# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim

# base nvchad config
rm -rf ~/.local/share/nvim/
rm -rf ~/.config/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim/ --depth 1 && nvim
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/.github
rm -rf ~/.config/nvim/.gitignore

# nerd fonts
fonts_to_install=("FiraCode" "FiraMono" "Ubuntu" "UbuntuMono")
git clone --sparse --depth=1 --filter=blob:none https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
# Add the fonts to install to the sparse-checkout
git sparse-checkout add $(printf "patched-fonts/%s " "${fonts_to_install[@]}")


./install.sh "${fonts_to_install[@]}"
cd ..
rm -rf nerd-fonts

# delta
# TODO: fix hardcode file name
wget https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz
tar -xvf delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz
mv delta-0.18.2-x86_64-unknown-linux-gnu/delta ~/.local/bin/delta
rm -rf delta-0.18.2-x86_64-unknown-linux-gnu/
rm delta-0.18.2-x86_64-unknown-linux-gnu.tar.gz
# delta theme
git clone https://github.com/catppuccin/delta.git ~/.config/delta

# bat
wget -c https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-v0.25.0-x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
mv bat-v0.25.0-x86_64-unknown-linux-gnu/bat ~/.local/bin/bat
mv bat-v0.25.0-x86_64-unknown-linux-gnu/bat.1 ~/.local/share/man/man1/bat.1
rm -rf bat-v0.25.0-x86_64-unknown-linux-gnu/
# bat theme
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" \
https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build

# gh
wget https://github.com/cli/cli/releases/download/v2.74.1/gh_2.74.1_linux_386.tar.gz
tar -xvf gh_2.74.1_linux_386.tar.gz
mv gh_2.74.1_linux_386/bin/gh .local/bin/gh
mv gh_2.74.1_linux_386/share/man/man1/* .local/share/man/man1/
# login
gh auth login --web -h github.com
gh extension install github/gh-copilot --force

# eza
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
mv eza ~/.local/bin/

# zsh
# from https://gist.github.com/ZhaofengWu/f345652e994e3b68c309352a7610460f
set -e

# OPTIONAL: zsh will not install without ncurses. IF your machine doesn't have ncurses, you need to install it first.
export CXXFLAGS=" -fPIC" CFLAGS=" -fPIC" CPPFLAGS="-I${HOME}/include" LDFLAGS="-L${HOME}/lib"
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar -xzvf ncurses-6.2.tar.gz
cd ncurses-6.2
./configure --prefix=$HOME/.local  --enable-shared
make
make install
cd .. && rm ncurses-6.2.tar.gz && rm -r ncurses-6.2

# install zsh itself
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME/.local
make
make install
cd .. && rm zsh.tar && rm -r zsh
echo -e "export SHELL=~/bin/zsh\nexec ~/bin/zsh -l" >> ~/.bash_profile # or chsh

# oh my zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

