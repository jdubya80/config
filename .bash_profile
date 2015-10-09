#export HISTCONTROL=erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000

alias ll="ls -alh"
export PATH=$PATH:/usr/bin/arcanist/bin:/root/percona-toolkit-2.2.13/bin/

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
