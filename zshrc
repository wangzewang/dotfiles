export ZSH="/$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#source ~/.dockerfunc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export TERM=xterm-256color

# Ruby conf
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

# Go conf
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export OS_OUTPUT_GOPATH=1
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
# Go bin
export PATH="$GOPATH/bin:$PATH"

#proxy
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890

# Python pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
# pyenv python3.7.7 bin
export PATH="/home/zw/.pyenv/versions/3.7.7/bin/:$PATH"

# Haskell bin
export PATH="/home/zw/.local/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Swap CapsLock with esacpe
setxkbmap -option "caps:swapescape"

# Sync primary clipboard & selection clipboard
autocutsel -fork -selection CLIPBOARD && autocutsel -fork -selection PRIMARY

# Force me not to use multi tabs
#if [ "$TMUX" = "" ]; then dev; fi
#
#neofetch
source ~/.functions
source ~/.aliases
