# Path to your oh-my-zsh installation.
export ZSH=/Users/zhangli/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump osx sublime common-aliases themes tmux zsh-syntax-highlighting zsh-autosuggestions z d)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/sw/bin:/sw/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"


# zhangli's settings 
export LSCOLORS="exfxcxdxbxexexabagacad"
alias ll='ls -al'
alias cls='clear'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s py=subl
alias -s js=subl
alias -s c=subl
alias -s java=subl
alias -s txt=subl
alias -s cpp=subl
alias -s h=subl

# docker
alias dc='docker-compose'
alias dm='docker-machine'
alias deit='docker exec -i -t'

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/Library/TeX/texbin
export CLASSPATH=.

export LANG="zh_CN.UTF-8"
#export LC_ALL="zh_CN.UTF-8"
#export TERM=xterm-256color

# cscope settings
export EDITOR=subl
export VIEWER=subl

# go
#export GOROOT=/usr/local/Cellar/go/1.5.1
#export PATH=$PATH:$GOROOT/bin
#export GOPATH=~/code/go
export PATH=/Users/zhangli/go/bin/:$PATH

# virtualenvwrapper
# source /usr/local/bin/virtualenvwrapper.sh


# added by Anaconda3 4.0.0 installer
# export PATH="/Users/zhangli/anaconda3/bin:$PATH"
export PATH=~/anaconda2/bin:$PATH

export GTAGSLIBPATH=$HOME/.gtags/

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


. /Users/zhangli/torch/install/bin/torch-activate

# brew cask
HOMEBREW_CASK_OPTS=/opt/homebrew-cask/Caskroom

# git alias
alias glm="git ls-files --modified"
alias glma="git ls-files --modified | xargs git add"

# percol
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^G' percol_select_history
fi

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

function ccol() {
    tr -s " " | cut -d ' ' -f $1
}

# ccache
alias clang++-ccache="ccache clang++"
alias clang++-ccache="ccache clang"

# pkg-config
export PKG_CONFIG_PATH=/usr/local/Cellar/boost/1.63.0/lib/pkgconfig:$PKG_CONFIG_PATH

# proxychains
alias pc="proxychains4 -f ~/.proxychains.conf"


# nvm
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
source ~/git/nvm/nvm.sh

# httpproxy
alias proxy="http_proxy=http://0.0.0.0:8123 https_proxy=http://0.0.0.0:8123"
alias proxy208="http_proxy=http://192.168.199.208:8123 https_proxy=http://192.168.199.208:8123"
alias proxyhk="http_proxy=http://47.52.111.105:8123 https_proxy=http://47.52.111.105:8123"


alias unloadpp="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist"
alias startkcp="/Users/zhangli/go/bin/client -r 47.52.111.105:6500 -l :6500 -mode fast2"
alias sslocal="ss-local -s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1080 -m aes-256-cfb -k test123 --fast-open"

# Prezto
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# trash-cli
alias rt="trash"
