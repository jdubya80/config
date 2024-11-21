# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#export GOPATH=$HOME/projects/go
#export GOROOT="/usr/local/go"
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#export PATH="$PATH:/Users/jstubbs/.asdf/installs/golang/1.19.1/packages/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME_RANDOM_IGNORED=(example candy alanpeabody kardan juanghurtado imajes wuffers)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf golang)

source $ZSH/oh-my-zsh.sh

# User configuration

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cde='cd /Users/jstubbs/projects/elixir'

#### CUSTOM SETTINGS ####
set -o vi

# path shortcuts
alias gos='cd "$GOPATH"'
alias cci='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/content-import'
alias ccm='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/content-management'
alias ccp='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/picd'
alias cch='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/hotel'
alias cdm='cd /Users/jstubbs/projects/go/src/github.com/PartnerFusionInc/merchanting'
alias jgo='cd /Users/jstubbs/projects/go/src/github.com/jstubbs'
alias cm='cd /Users/jstubbs/projects/mystique'
alias cdr='cd /Users/jstubbs/projects/raven'
alias cdc='cd /Users/jstubbs/projects/cable'
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

#databases
alias user-int='export PGHOST=int-raven.cluster-corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile devuser-tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_user)" && psql "dbname=raven user=tpg_user"'
alias user-stg='export PGHOST=stg-raven.cluster-ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile devuser-tpg-prod rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_user)" && psql "dbname=raven user=tpg_user"'
alias user-prd='export PGHOST=prd-raven.cluster-ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile devuser-tpg-prod rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_user)" && psql "dbname=raven user=tpg_user"'

alias arch-int='export PGHOST=int-raven.cluster-corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=raven user=tpg_architect"'
alias arch-stg='export PGHOST=stg-raven.cluster-ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=raven user=tpg_architect"'
alias arch-prd='export PGHOST=prd-raven.cluster-ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=raven user=tpg_architect"'

alias impt-int='export PGHOST=int-impt-db.corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=content user=tpg_architect"'
alias impt-stg='export PGHOST=stg-impt-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=content user=tpg_architect"'
alias impt-prd='export PGHOST=prd-impt-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=content user=tpg_architect"'

alias cable-int='export PGHOST=int-impt-db.corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=content user=tpg_architect"'
alias cable-stg='export PGHOST=stg-cable-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=postgres user=tpg_architect"'
alias cable-prd='export PGHOST=prd-cable-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=postgres user=tpg_architect"'

alias mrch-prd='export PGHOST=prd-mrch-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=card_db user=tpg_architect"'
alias mrch-stg='export PGHOST=stg-mrch-db.ct9e5y4sluik.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-prd rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=card_db user=tpg_architect"'
alias mrch-int='export PGHOST=int-mrch-db.corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=card_db user=tpg_architect"'

alias myst-prd='export PGHOST=prod-mpp.corm6d8k2ye5.us-west-2.rds.amazonaws.com && export PGPASSWORD="$(aws --profile tpg-main rds generate-db-auth-token --hostname $PGHOST --port 5432 --region us-west-2 --username tpg_architect)" && psql "dbname=bookings user=tpg_architect"'

# elixir stuff
export ERL_AFLAGS="-kernel shell_history enabled"

#. /opt/homebrew/opt/asdf/libexec/asdf.sh

# bindkey bindings
bindkey "^R" history-incremental-pattern-search-backward
