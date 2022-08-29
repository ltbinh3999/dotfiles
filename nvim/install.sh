#!/usr/bin/bash
set -e
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt-get install -y ./nvim-linux64.deb
rm ./nvim-linux64.deb
nvim --version
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
