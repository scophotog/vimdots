#!/bin/bash

cp .vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

# CTRL-P
git clone https://github.com/kien/ctrlp.vim.git
# NERDTree
git clone https://github.com/scrooloose/nerdtree.git
# NERDTreeTabs
git clone https://github.com/jistr/vim-nerdtree-tabs.git
# I like Solarized
git clone https://github.com/altercation/vim-colors-solarized.git
# Vim Airline
git clone https://github.com/bling/vim-airline.git

# TODO: Deal with fonts somehow
