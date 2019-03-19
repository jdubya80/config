#Install vim-pathogen for realtime path management.  Super easy plugin install and runtime file ... usage I guess.

#Install directions:
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


#Of course this could change at any time.  Consult the utilities page for the most recent directions.


#install ctrlp... maybe - not sure I really use it yet.
cd ~/.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim



#install vim-fugitive - cool git stuff
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
