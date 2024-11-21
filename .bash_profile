#export HISTCONTROL=erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000

alias ll="ls -alh"

#add go gopath
#export GOROOT=/usr/local/Cellar/go@1.10/1.10.4/libexec/
export GOPATH=$HOME/projects/go
#export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/postgresql@9.4/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/share/dotnet
export PATH=$PATH:~/.mix/escripts

#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
/usr/bin/ssh-add -A 2>/dev/null
#ssh-add ~/.ssh/id_rsa

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# https://github.com/rbenv/rbenv
# eval "$(rbenv init -)"
export PATH="/usr/local/opt/go/bin:$PATH"

# aws stuff
export AWS_SECRET_ACCESS_KEY=`aws configure get default.aws_secret_access_key`
export AWS_ACCESS_KEY_ID=`aws configure get default.aws_access_key_id`
export AWS_REGION=`aws configure get default.region`

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# asdf stuff
. /usr/local/opt/asdf/libexec/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

eval "$(/opt/homebrew/bin/brew shellenv)"
