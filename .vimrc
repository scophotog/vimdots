" Load the pathgen stuff
execute pathogen#infect()

" This must be first
    set nocompatible

" General Config
    set number                      " Line Numbers
    set backspace=indent,eol,start  " Allow basckspace in insert mode
    set history=1000                " Lots of history
    " set showmode                    " Show current mode
    set showcmd                     " Show incomplete commands
    set gcr=a:blinkon0              " No blinking cursor
    set visualbell                  " No sounds
    set autoread                    " Reload files changed outside vim
    set title                       " Set title in window
    set hidden                      " Buffers exist in background
    syntax on                       " Syntax highlighting

" Change leader from \ to ,
    let mapleader=","

" Visuals
    set background=dark
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized " Load a colorscheme
    endif


    filetype plugin indent on

    set ttyfast
    set encoding=utf-8

" Searching
    set hlsearch
    set ignorecase
    set incsearch
    set gdefault

" Folding
    set foldmethod=indent           " Fold based on indent
    set foldnestmax=3               " max 3 folds
    set nofoldenable                " don't fold by default

" Tab/Indentation
    set autoindent
    set smartindent
    set smarttab
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    vnoremap > ><CR>gv
    vnoremap < <<CR>gv

" Completion
    set wildmode=longest,list:longest
    set wildmenu
    set wildignore=*.o,*.obj,*~
    set wildignore+=*.class
    set wildignore+=*DS_Store*
    set wildignore+=tmp/**
    set wildignore+=*.png,*.jpg,*.gif
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Show “invisible” characters
    set lcs=tab:▸\ ,trail:·
    set list

" Scrolling
    set scrolloff=4
    set sidescrolloff=10
    set sidescroll=1

" Make j/k move to next visual line instead of physcial line
    nnoremap k gk
    nnoremap j gj
    nnoremap gk k
    nnoremap gj j

" Navigate tabs by using Shift-H and Shift L
    map <S-H> gT
    map <S-L> gt
" Mouse enabled
"    set mouse=a
"    set mousehide

" If we're in tmux set the clipboard
    if $TMUX == ''
        set clipboard=unnamed
    endif

" automatically reload vimrc when it's saved
"    au BufWritePost .vimrc so ~/.vimrc

" NERDTree
"    nmap <leader>d :NERDTreeToggle<CR>

" NERDTreeTabs
    map <leader>d <plug>NERDTreeTabsToggle<CR>

" CTRL-P
    let g:ctrlp_map = '<leader>t'
    " Default to final name searches
    let g:ctrlp_by_filename = 1

    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    else
      let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    endif

" end CTRL-P config

" Vim Airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    set laststatus=2
    set noshowmode " hide default mode text since we're using vim-airline

" Terminal timeout is annoying
    if ! has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif
