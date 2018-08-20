# Jove's Zsh Cofingure
# Web Sites : http://jovesky.com
# Contact Jove : yushijun110[at]gmail.com
#
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jove"

plugins=(
    git
    virtualenv
    brew
    cp
    autojump
    osx
    python
    history
)
source $ZSH/oh-my-zsh.sh

#alias
alias vim='nvim'
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# export
export GOPATH=$HOME/.go_path
export PATH=$PATH:$HOME/.npm/bin/:$GOPATH/bin/
export EDITOR="nvim"
export TERM=xterm-256color
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass

# env
if [ -e ~/work/python3/bin/activate ]
then
    source ~/work/python3/bin/activate
fi
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"