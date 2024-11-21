#!/bin/bash

git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# need added conditionally (depends on what language I'm wokring in)
# .vim/bundle/elixir-ls
# .vim/bundle/vim-go
# .vim/bundle/vim-mix-format
# .vim/bundle_backup/elixir-ls
