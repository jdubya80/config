#export HISTCONTROL=erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000

alias ll="ls -alh"

#add go gopath
export GOPATH=$HOME/projects/go
#export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/postgresql@9.4/bin

#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
/usr/bin/ssh-add -A 2>/dev/null
#ssh-add ~/.ssh/id_rsa

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# https://github.com/rbenv/rbenv
eval "$(rbenv init -)"
