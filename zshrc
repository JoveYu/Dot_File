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
# alias pxy='proxychains4'
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
export GEM_HOME="$HOME/.gem"
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/.gopath"
export PATH=$PATH:$HOME/.npm/bin/:$GOPATH/bin/:$HOME/.luarocks/bin/:$GEM_HOME/bin/
export EDITOR="nvim"
export TERM=xterm-256color
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
# export PYTHONPATH=~/work/
# eval `luarocks path --bin`


# env
if [ -e ~/work/python3/bin/activate ]
then
    source ~/work/python3/bin/activate
fi
use_python2() {
    deactivate
    source ~/work/python2/bin/activate
}
use_python3() {
    deactivate
    source ~/work/python3/bin/activate
}

# func 
pxy() {
    HTTP_PROXY=http://127.0.0.1:1087 \
    HTTPS_PROXY=http://127.0.0.1:1087 \
    SOCKS5_PROXY=socks5://127.0.0.1:1080 \
    http_proxy=http://127.0.0.1:1087 \
    https_proxy=http://127.0.0.1:1087 \
    socks5_proxy=socks5://127.0.0.1:1080 \
    $@
}

mkpwd () {
    cat /dev/urandom | base64 | tr -dc '0-9a-zA-z=' | fold -w $@ | head -n1
}

if [ -e ~/.zshrc.local ]
then
    source  ~/.zshrc.local
fi
