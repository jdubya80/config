#export HISTCONTROL=erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000

alias ll="ls -alh"


#add go gopath
export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
