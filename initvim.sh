#!/bin/bash

cp vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

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
# tmuxline
git clone https://github.com/edkolev/tmuxline.vim.git
# vim-fugutive
git clone https://github.com/tpope/vim-fugitive.git
# neocomplache
git clone https://github.com/Shougo/neocomplcache.vim.git
# neosnippet
git clone https://github.com/Shougo/neosnippet.vim.git
# autoclose
git clone https://github.com/spf13/vim-autoclose.git
# neosnippet snippets
git clone https://github.com/Shougo/neosnippet-snippets.git
# vim-tmux
git clone https://github.com/peterhoeg/vim-tmux.git
# vim javascript syntax
git clone https://github.com/jelera/vim-javascript-syntax.git
# tagbar
git clone https://github.com/majutsushi/tagbar.git
# TODO: Deal with fonts somehow

