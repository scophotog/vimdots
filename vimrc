" Load the pathgen stuff
execute pathogen#infect()

" This must be first
    set nocompatible

" General Config {
    set number                      " Line Numbers
    "ruler                          " Show cursor position
    set backspace=indent,eol,start  " Allow basckspace in insert mode
    set history=1000                " Lots of history
    " set showmode                    " Show current mode
    set showcmd                     " Show incomplete commands
    set gcr=a:blinkon0              " No blinking cursor
    set visualbell                  " No sounds
    set autoread                    " Reload files changed outside vim
    set title                       " Set title in window
    set hidden                      " Buffers exist in background
    syntax enable                   " Syntax highlighting

  " Change leader from \ to ,
    let mapleader=","


  " Set backup and swap dirs
    set backupdir=~/.vim/tmp,/tmp
    set directory=~/.vim/tmp,/tmp
" }

" Visuals {
    set background=dark
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized
    endif

    filetype plugin indent on

    set ttyfast
    set encoding=utf-8
" }

" Searching
    set hlsearch
    set ignorecase
    set smartcase
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
    set shiftwidth=2
    set tabstop=8
    set softtabstop=2
    vnoremap > ><CR>gv
    vnoremap < <<CR>gv

" Completion
    set wildmode=longest,list,full
    set wildmenu
    set wildignore=*.o,*.obj,*~
    set wildignore+=*.class
    set wildignore+=*DS_Store*
    set wildignore+=tmp/**
    set wildignore+=*.png,*.jpg,*.gif
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    set wildignore+=node_modules/**,target/**

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
    set mouse=a
    if exists('$TMUX')
        set ttymouse=xterm2
    endif
"    set mousehide

" If we're in tmux set the clipboard
    if $TMUX == ''
        set clipboard=unnamed
    endif

" Fix Cursor in TMUX
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif

" automatically reload vimrc when it's saved
"    au BufWritePost .vimrc so ~/.vimrc

" NERDTree
"    nmap <leader>d :NERDTreeToggle<CR>

" NERDTreeTabs
    map <leader>d <plug>NERDTreeTabsToggle<CR>

" CTRL-P {
    let g:ctrlp_map = '<leader>t'
    " Default to final name searches
    let g:ctrlp_by_filename = 1

    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor  -g ""'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    else
      let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    endif

" }

" Vim Airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    set laststatus=2
    set noshowmode " hide default mode text since we're using vim-airline

" tmuxline
let g:airline#extensions#tmuxline#enabled = 1

" Terminal timeout is annoying
    if !has('gui_running')
        set ttimeoutlen=10
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif

" neocomplcache {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " SuperTab like snippets behavior
    imap <silent><expr><TAB> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<TAB>")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><CR> neocomplache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " <CR>: close popup
    " <CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets'

    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
" }
