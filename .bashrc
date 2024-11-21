set -o vi

# path shortcuts
alias gos='cd "$GOPATH"'
alias ccm='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/content-management'
alias ccp='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/picd'
alias cch='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/hotel'
alias cdm='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/merchanting'
alias jgo='cd /Users/jstubbs/projects/go/src/github.com/jstubbs'

alias cm='cd /Users/jstubbs/projects/mystique'
alias cdr='cd /Users/jstubbs/projects/raven'
alias cde='cd /Users/jstubbs/projects/elixir'
alias cdb='cd /Users/jstubbs/projects/databases/postgres/'
alias capi='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/content-api'
alias gstubbs='cd /Users/jstubbs/projects/go/src/github.com/jstubbs'
alias ak='aws-vault exec devAcct -- kubectl'
alias att='aws-vault exec terraformAcct -- terraform'
alias adt='aws-vault exec devAcct -- terraform'
alias akt='aws-vault exec terraformAcct -- kubectl'
alias akd='aws-vault exec devAcct -- kubectl describe'

#git
alias gf='git fetch --all --prune'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gbc='git branch --contains'
alias gb='git branch'

#docker, docker-compose
alias dc='docker-compose'
alias d='docker'

# kube
alias k=kubectl

#terraform
alias t=terraform

function checkoutfoo() {
    git branch | grep "$@" | xargs git checkout;
}

function checkout() {
    remote_branch=$(git branch -r --list origin* | grep "$@");
    echo "checking out $remote_branch ...";
    git checkout --track $remote_branch 2> /dev/null;

    if [ $? -eq "128" ]; then
        target_branch=${remote_branch:9};
        git checkout $target_branch;
    fi
}

function gitlint {
git status | cut -c 3- | egrep  '^(modified|new file)' | egrep '\.(php|view|get|inc|controller|act)$' |awk -F: '{ gsub(/[[:space:]]*/,"", $2); print $2}' |xargs -n1 php -l
}

function check() {
    ps aux | grep "$@";
}

# Bash completion
#if [ -f /etc/bash_completion ]; then
#. /etc/bash_completion
# load git bash completion
#export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
#fi

if [ -f /usr/share/bash-completion/git ]; then
    source /usr/share/bash-completion/git
fi

if [ -f ~/git-prompt.sh ]; then
    source ~/git-prompt.sh
fi

#if [ -f /usr/share/bash-completion/git ]; then
if [ -f ~/git-completion.bash ]; then
    source ~/git-completion.bash
    #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
    export PS1='\[\033[01;32m\]\u\[\033[01;34m\] \W\[\033[01;34m\]$(__git_ps1) $ \[\033[00m\]'
fi

# Cool trick to show current git branch in the command prompt in gentoo colors.
#export PS1='\[33[01;32m\]\u@\h\[33[01;34m\] \w$(__git_ps1 " (%s)") \$\[33[00m\] '
#export PS1='\[33[01;32m\]\u@\h\[33[01;34m\] \w$(" ") \$\[33[00m\] '

#exports are all over the place todo: organize exports
export EDITOR=vi

#turn off XON/XOFF flow contro
#turn off XON/XOFF flow controll
#the following line is an attemtp to prevent "Inappropriate ioctl for device"
#taken from http://stackoverflow.com/questions/24623021/getting-stty-standard-input-inappropriate-ioctl-for-device-when-using-scp-thro
[[ $- == *i* ]] && stty -ixon
#stty -ixon


#Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
#When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

#when the shell exits, append to history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

#start ssh agent and export it's variables to the environment
#eval `ssh-agent -s`

#add our agent
#ssh-add


#postgres stuff
#export PAGER=less
#export LESS="-iMSx4 -FX"
source <(kubectl completion bash)

complete -C /usr/local/bin/vault vault

# elixir stuff
export ERL_AFLAGS="-kernel shell_history enabled"
