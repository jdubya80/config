set background=dark
set noautoindent
au BufNewFile,BufRead *.view set filetype=php
au BufNewFile,BufRead *.act set filetype=php




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $VIM SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set hidden                               " best. thing. ever. no buffer closed
set antialias
set cursorline                           " highlight the line cursor is on
set hlsearch                             " highlight all matches
set ignorecase                           " case insensitive searches
set incsearch                            " highlight matches while typing
set ls=2
set nowrap
set number                               " show line numbers
set showmatch                            " jump to search result
set smartcase                            " case insensitive defaul
set smartindent                          " block indentation
set softtabstop=4                        " back character length
set tabstop=4                            " tab character length
set numberwidth=4                        " set line numbers section width
set shiftwidth=4                         " shift movement length
set colorcolumn=120
set expandtab
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ignored by vim fs access
set wildignore+=*/templates_c/*,*/bin/*
set wildignore+=*/node_modules/*
set t_Co=256
set wildmenu
set tags^=./.tags,./.TAGS,.tags,.TAGS

set nobackup                             " dont create tmp backup files
set nowritebackup                        " dont create tmp backup files
set noswapfile                           " dont create tmp backup files
set scrolloff=3                          " buffer for screen when scrolling
set ttyfast                              " makes things... smoother?

set list
set listchars=trail:.,tab:»·

map <C-j> <ESC>:bp<CR>
map <C-k> <ESC>:bn<CR>

"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/vim-fugitive.vim

execute pathogen#infect()

let g:ctrlp_root_markers = ['.domainconfig'] "from Matt Styles: ctrlP will start the 'base' of the search from the nearest directory with a .domainconfig
let g:ctrlp_use_caching=1
let g:ctrlp_max_files = 0
