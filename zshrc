export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
  git
  zsh-autosuggestions
  wakatime
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/.functions
source ~/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export TERM=xterm-256color

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin
export OS_OUTPUT_GOPATH=1
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
# Force me not to use multi tabs
#if [ "$TMUX" = "" ]; then dev; fi
