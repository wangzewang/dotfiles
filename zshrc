export ZSH="/$HOME/.oh-my-zsh"

#ZSH_THEME="spaceship"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
  git
  autojump
  wakatime
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#source ~/.dockerfunc
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export TERM=xterm-256color

# Ruby conf
#export RBENV_ROOT=/usr/local/var/rbenv
#eval "$(rbenv init -)"

# Go conf
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export OS_OUTPUT_GOPATH=1
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
# Haskell bin
export PATH="/home/zw/.local/bin:$PATH"
# Python pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
# pyenv python3.7.7 bin
export PATH="$HOME/.pyenv/versions/3.9.10/bin:$PATH"
# krew bin
export PATH="${PATH}:${HOME}/.krew/bin"

export PATH="/Users/wangzewang/.nvm/versions/node/v16.15.1/bin:$PATH"

eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Swap CapsLock with esacpe
#setxkbmap -option "caps:swapescape"

# Sync primary clipboard & selection clipboard
#autocutsel -fork -selection CLIPBOARD && autocutsel -fork -selection PRIMARY

# Force me not to use multi tabs
#if [ "$TMUX" = "" ]; then dev; fi
#
#neofetch
source ~/.functions
source ~/.aliases
#eval "$(starship init zsh)"
source <(kubectl completion zsh)
#source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

autoload -U promptinit; promptinit
prompt pure

export EDITOR='nvim'
eval "$(zoxide init zsh)"

#proxy
#export HTTP_PROXY=http://127.0.0.1:7890
#export HTTPS_PROXY=http://127.0.0.1:7890

# pnpm
#export PNPM_HOME="/Users/wangzewang/Library/pnpm"
#export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH="/Users/wangzewang/.nvm/versions/node/v16.15.1/bin:$PATH"

