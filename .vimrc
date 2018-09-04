set nocompatible "ruby says so https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
set background=dark
set noautoindent
set history=10000
au BufNewFile,BufRead *.view set filetype=php
au BufNewFile,BufRead *.act set filetype=php
au BufNewFile,BufRead *.controller set filetype=php

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

"autocmd BufNewFile,BufRead *.ruby set shiftwidth=2
"autocmd BufNewFile,BufRead *.ruby set tabstop=2
"autocmd BufNewFile,BufRead *.ruby set softtabstop=2

set list
set listchars=trail:.,tab:»·
"set listchars=eol:⏎,trail:␠,tab:␉,nbsp:⎵

"KEY MAPPINGS
map <C-j> <ESC>:bp<CR>
map <C-k> <ESC>:bn<CR>
noremap <leader>f <ESC>:CtrlP<CR> "invoke CtrlP's "find"
nmap <leader>c ::bp\|bd #<CR>

"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/vim-fugitive.vim

execute pathogen#infect()
syntax on
filetype on "ruby says so https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
filetype plugin on
filetype indent on


let g:ctrlp_root_markers = ['.domainconfig'] "from Matt Styles: ctrlP will start the 'base' of the search from the nearest directory with a .domainconfig
let g:ctrlp_use_caching=1
let g:ctrlp_max_files = 0

let g:airline#extensions#tabline#enabled = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:go_fmt_command = "goimports"

" key mappings
inoremap jj <ESC>
inoremap jk <ESC>
nmap <F8> :TagbarToggle<CR>

" This trigger takes advantage of the fact that the quickfix window can be
" " easily distinguished by its file-type, qf. The wincmd J command is
" " equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" " the very bottom (see :help :wincmd and :help ^WJ).
" taken from https://github.com/fatih/vim-go/issues/108
autocmd FileType qf wincmd J

" From https://blog.gopheracademy.com/vimgo-development-environment
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
"go specific
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>1 <Plug>(go-info)

" Magic line moves from http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap ^[j :m .+1<CR>==
nnoremap ^[k :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }
"

" add go lint on write support
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
