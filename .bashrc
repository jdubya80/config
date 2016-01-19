set -o vi

alias astrel='yes y | php /root/dialer_code/Asterisk/asterisk_release.php dev'
alias acmrel='yes y | php /root/dialer_code/ACM/acm_release.php dev'

alias sta='cd /var/www/sta'
alias qb='cd /var/www/QueryBuilder'
alias nex='cd /var/www/sta/ext/is/nexusdomain'
alias comms='cd /var/www/CommsWorkers'
alias mac='cd /var/www/MAC'
alias iswsi='cd /var/www/iswsi'
alias ast='cd /root/dialer_code/AsteriskDialer'
alias fmysql='ps aux | grep mysq[l]'
alias mysqlb='/etc/init.d/mysql start'
alias mysqle='/etc/init.d/mysql stop'
alias mysqlv='/usr/sbin/mysqld --version'

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

if [ -f /usr/share/bash-completion/git ]; then
    source ~/git-completion.bash
fi

if [ -f /Applications/SourceTree.app/Contents/Resources/git_local/contrib/completion/git-completion.bash ]; then
    source /Applications/SourceTree.app/Contents/Resources/git_local/contrib/completion/git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE=true
    #export PS1='[\u@\h \w$(__git_ps1)]\$ '
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;34m\]$(__git_ps1) $ \[\033[00m\]'
else
    function formattedGitBranch {
        _branch="$(git branch 2>/dev/null | sed -e "/^\s/d" -e "s/^\*\s//")";
        echo -e "\001\e[0;91m\002 ($_branch)";
    }
    
    #PS1='$(formattedGitBranch) '
 
    export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[01;33m\]$(formattedGitBranch)\[\033[01;34m\]\$\[\033[00m\] '
fi

# Cool trick to show current git branch in the command prompt in gentoo colors.
#export PS1='\[33[01;32m\]\u@\h\[33[01;34m\] \w$(__git_ps1 " (%s)") \$\[33[00m\] '
#export PS1='\[33[01;32m\]\u@\h\[33[01;34m\] \w$(" ") \$\[33[00m\] '

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
eval `ssh-agent -s`

#add our agent
ssh-add
