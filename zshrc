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
    history-substring-search
    extract
    command-not-found
)
source $ZSH/oh-my-zsh.sh


#alias
if command -v trash &> /dev/null; then
    alias rm='trash'
fi
if command -v nvim &> /dev/null; then
    alias vim='nvim'
fi
if command -v xdg-open &> /dev/null; then
    alias open='xdg-open'
fi

# export
export LANG=zh_CN.UTF-8
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export GEM_HOME=$HOME/.gem
export NVM_DIR=$HOME/.nvm
export GOPATH=$HOME/.gopath
export NPM_PACKAGES=$HOME/.npm
export NODE_PATH=$NPM_PACKAGES/lib/node_modules
export PATH=$NPM_PACKAGES/bin:$GOPATH/bin:$HOME/.krew/bin:$PATH
export EDITOR=nvim
export TERM=xterm-256color
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE="gitee.com/linakesi"
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# func
pxy() {
    # HTTP_PROXY=http://127.0.0.1:1087 \
    # HTTPS_PROXY=http://127.0.0.1:1087 \
    SOCKS5_PROXY=socks5://127.0.0.1:1080 \
    ALL_PROXY=socks5://127.0.0.1:1080 \
    # http_proxy=http://127.0.0.1:1087 \
    # https_proxy=http://127.0.0.1:1087 \
    socks5_proxy=socks5://127.0.0.1:1080 \
    all_proxy=socks5://127.0.0.1:1080 \
    $@
}
unzip-gbk() {
    LANG=C 7za x $1
    convmv -f GBK -t utf8 --notest -r .
}
pdf2jpg() {
    pdf_dir=$(basename $1 .pdf)
    mkdir $pdf_dir
    pdftoppm -jpeg "$1" "$pdf_dir/$pdf_dir"
}


if [ -e ~/.zshrc.local ]
then
    source  ~/.zshrc.local
fi


# remove duplicates path
typeset -U PATH
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
