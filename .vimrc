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
set tags^=./.tags;,./.TAGS;,.tags;,.TAGS;,tags;$HOME
colorscheme torte

set nobackup                             " dont create tmp backup files
set nowritebackup                        " dont create tmp backup files
set noswapfile                           " dont create tmp backup files
set scrolloff=3                          " buffer for screen when scrolling
set ttyfast                              " makes things... smoother?

set list
set listchars=trail:.,tab:»·

"KEY MAPPINGS
"let mapleader=" "
map <C-j> <ESC>:bp<CR>
map <C-k> <ESC>:bn<CR>
noremap <leader>f <ESC>:CtrlP<CR> "invoke CtrlP's "find"
nmap <leader>c ::bp\|bd #<CR>

" Coc
nmap <leader>ld <Plug>(coc-definition)
nnoremap <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
nmap <leader>la <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)
noremap <leader>lh :call CocAction('doHover')<CR>
noremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>

" Copy / Paste
vnoremap <leader>c "*y
map <leader>v "*p

let g:go_debug = [ "shell-commands" ]

" eventually replace infect with plug or package (things in pack that have
" start folers
execute pathogen#infect()
syntax on
filetype on "ruby says so https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
"filetype plugin on
"filetype indent on
filetype plugin indent on

"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40
"let g:ctrlp_working_path_mode=""

" control max height of ctrlp window
"let g:ctrlp_match_window="max:100"

" https://github.com/ggreer/the_silver_searcher config
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'
"let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <S-F> :Ag<CR>

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

" nnoremap n nzz
" nnoremap N Nzz

" Copy file path
map <leader>p :let @*=@%<CR>

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

" add go lint on write support
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" ruby support (and probably more) for moving to the beginning and end of if
" end blocks
runtime macros/matchit.vim

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" terraform
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1
let g:terraform_align=1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"Use <CR> to confirm completion, use:

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1):
"      \ <SID>check_back_space() ? "\<Tab>" :
""      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" remap enter to trigger element selection when in popup menu
" inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

" let g:coc_user_config = '~/.config/vim/coc-settings.json'
let g:coc_user_config = '~/.vim/coc-settings.json'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" elixir config
"autocmd CompleteDone * pclose " To close preview window of deoplete automagically
"tnoremap <ESC>   <C-\><C-n>
"
"" neomake
"augroup localneomake
"autocmd BufWritePost * Neomake
"augroup END
"
"" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
"let g:neomake_elixir_enabled_makers = ['mycredo', 'mix']
"function! NeomakeCredoErrorType(entry)
"  if a:entry.type ==# 'F'      " Refactoring opportunities
"    let l:type = 'W'
"  elseif a:entry.type ==# 'D'  " Software design suggestions
"    let l:type = 'I'
"  elseif a:entry.type ==# 'W'  " Warnings
"    let l:type = 'W'
"  elseif a:entry.type ==# 'R'  " Readability suggestions
"    let l:type = 'I'
"  elseif a:entry.type ==# 'C'  " Convention violation
"    let l:type = 'W'
"  else
"    let l:type = 'M'           " Everything else is a message
"  endif
"  let a:entry.type = l:type
"endfunction
"
"let g:neomake_elixir_mycredo_maker = {
"      \ 'exe': 'mix',
"      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
"      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
"      \ 'postprocess': function('NeomakeCredoErrorType')
"      \ }
"let g:neomake_open_list = 2
"
"" ALE setup
"let g:ale_fixers = {
"\ 'elixir':  ['mix_format']
"\}
"
"let g:ale_fix_on_save = 1
"" Letting coc.vim do the completion instead of ale
"let g:ale_completion_enabled = 0
"" use projects prettier and eslint settings
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = "\uf49f"
"let g:ale_virtualtext_cursor = 1
"
"" Test support
"let g:dispatch_compilers = {'elixir': 'exunit'}
"
"
""""""""""""""""""""""
"" vim-test extensions
""""""""""""""""""""""
"function! ElixirUmbrellaTransform(cmd) abort
"  if match(a:cmd, 'apps/') != -1
"    return substitute(a:cmd, 'mix test apps/\([^/]*/\)', 'cd apps/\1 \&\& mix test ', '')
"  else
"    return a:cmd
"  end
"endfunction
"
"
"let g:test#preserve_screen = 0
"let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
"let g:test#transformation = 'elixir_umbrella'
"
"" let g:coc_user_config = '~/.config/vim/coc-settings.json'

" elixir tagbar configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

" https://github.com/JamshedVesuna/vim-markdown-preview?tab=readme-ov-file 
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" ---------- Ctrl-P stuff --------------
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_user_command='ag %s -l --nocolor --ignore ".git/" --ignore "node_modules" --hidden -g ""'
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }
let g:ctrlp_use_caching=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }


" ------------- Super Tab --------------
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" ------------ Vista -------------------
let g:vista_sidebar_width = 55
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_icon_indent = ["▸ ", ""]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "ﬦ",
\   "module": " ",
\   "variable": "\ufb18 ",
\   "constant": ""
\  }

let g:vista_default_executive = 'coc'
