# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim

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

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.25.0/bat-v0.25.0-x86_64-unknown-linux-gnu.tar.gz
mv bat-v0.25.0-x86_64-unknown-linux-gnu/bat ~/.local/bin/bat
rm -rf bat-v0.25.0-x86_64-unknown-linux-gnu/
rm bat-v0.25.0-x86_64-unknown-linux-gnu.tar.gz


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

