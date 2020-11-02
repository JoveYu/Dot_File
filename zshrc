# Jove's Zsh config
# Web Sites : http://jove.im
# Contact Jove : yushijun110[at]126.com.com
#
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jove"

plugins=(
    git
    git-flow
    git-auto-fetch
    virtualenv
    brew
    cp
    autojump
    osx
    python
    history
    kubectl
    kube-ps1
    docker
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
)
source $ZSH/oh-my-zsh.sh


#alias
alias typora="open -a typora"
alias luarocks='luarocks --local'
alias vim='nvim'
alias npm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
if [ "$(uname)" = "Darwin" ]; then
    alias rm='trash'
fi

# export
export LANG=zh_CN.UTF-8
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export GEM_HOME=$HOME/.gem
export NVM_DIR=$HOME/.nvm
export GOPATH=$HOME/.gopath
export NPM_PACKAGES=${HOME}/.npm
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
export PATH=$PATH:$NPM_PACKAGES/bin/:$GOPATH/bin/:$HOME/.luarocks/bin/:$GEM_HOME/bin/
export PATH=$PATH:$HOME/.krew/bin
export EDITOR=nvim
export TERM=xterm-256color
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
# export PYTHONPATH=~/work/
# eval `luarocks path --bin`


# env
if [ -e ~/work/python3/bin/activate ]
then
    source ~/work/python3/bin/activate
fi

# func 
pxy() {
    HTTP_PROXY=http://127.0.0.1:1087 \
    HTTPS_PROXY=http://127.0.0.1:1087 \
    SOCKS5_PROXY=socks5://127.0.0.1:1080 \
    ALL_PROXY=socks5://127.0.0.1:1080 \
    http_proxy=http://127.0.0.1:1087 \
    https_proxy=http://127.0.0.1:1087 \
    socks5_proxy=socks5://127.0.0.1:1080 \
    all_proxy=socks5://127.0.0.1:1080 \
    $@
}


if [ -e ~/.zshrc.local ]
then
    source  ~/.zshrc.local
fi


# other
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
