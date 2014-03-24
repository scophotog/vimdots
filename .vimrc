execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set history=1000
set ttyfast
set encoding=utf-8
set ruler
set showmode
set showcmd

" Searching
set hlsearch
set ignorecase
set incsearch

" Tab
set expandtab
set shiftwidth=4
set tabstop=4

" Show numbers
set nu

set wildmode=longest,list:longest

" Change leader from \ to ,
let mapleader=","

" No bells
set noerrorbells

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·
set list

" Scroll 3 lines before the bottom
set scrolloff=3

set binary
set noeol

" Make j/k move to next visual line instead of physcial line
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Status Bar
set laststatus=2
set noshowmode " hide default mode text since we're using Powerline
set statusline=
set statusline+=%f\
set statusline+=%h%1*%m%r%w%0*
set statusline+=%=
set statusline+=%-14.(%l,%c%V%)\ %<%P

" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

" CTRL-P
let g:ctrlp_map = '<leader>t'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set clipboard=unnamed " Use the system clipboard
set autoread

" Powerline
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" let g:Powerline_symbols = 'fancy'
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Terminal timeout is annoying
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
