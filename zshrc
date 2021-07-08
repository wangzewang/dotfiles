export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
  git
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
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
