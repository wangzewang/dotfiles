!#/usr/bin/bash
cd ~
git clone --branch master --depth 1 https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~

