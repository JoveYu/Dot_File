# Jove's Zsh config
# Web Sites : http://jove.im
# Contact Jove : yushijun110[at]126.com.com
#
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jove"

plugins=(
    git
    git-flow
    virtualenv
    brew
    cp
    autojump
    python
    history
    kubectl
    helm
    docker
    zsh-syntax-highlighting
    zsh-autosuggestions
    history-substring-search
    extract
    command-not-found
    dotnet
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
export PATH=$NPM_PACKAGES/bin:$GOPATH/bin:$HOME/.krew/bin:$HOME/.local/bin:$PATH
export EDITOR=nvim
export TERM=xterm-256color
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
export SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass

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
    unzip -O gb2312 $1
    # LANG=C 7za x $1
    # convmv -f GBK -t utf8 --notest -r .
}
pdf2jpg() {
    pdf_dir=$(basename $1 .pdf)
    mkdir $pdf_dir
    pdftoppm -jpeg "$1" "$pdf_dir/$pdf_dir"
}
gcr-pull() {
    img=$(echo $1 | sed 's/k8s\.gcr\.io/anjia0532\/google-containers/g;s/gcr\.io/anjia0532/g;s/\//\./g;s/ /\n/g;s/anjia0532\./anjia0532\//g')
    docker pull $img
    n=$(echo ${img}| awk -F'[/.:]' '{printf "gcr.io/%s",$2}')
    image=$(echo ${img}| awk -F'[/.:]' '{printf "/%s",$3}')
    tag=$(echo ${img}| awk -F'[:]' '{printf ":%s",$2}')
    docker tag $img "${n}${image}${tag}" && docker image rm $img
    [[ ${n} == "gcr.io/google-containers" ]] && docker tag "${n}${image}${tag}" "k8s.gcr.io${image}${tag}"
}
kube-node-shell() {
    node=${1}
    nodeName=$(kubectl get node ${node} -o template --template='{{index .metadata.labels "kubernetes.io/hostname"}}') 
    nodeSelector='"nodeSelector": { "kubernetes.io/hostname": "'${nodeName:?}'" },'
    podName=${USER}-nsenter-${node}

    kubectl run ${podName:?} --restart=Never -it --rm --image overriden --overrides '
    {
      "spec": {
        "hostPID": true,
        "hostNetwork": true,
        '"${nodeSelector?}"'
        "tolerations": [{
            "operator": "Exists"
        }],
        "containers": [
          {
            "name": "nsenter",
            "image": "alexeiled/nsenter:2.34",
            "command": [
              "/nsenter", "--all", "--target=1", "--", "su", "-"
            ],
            "stdin": true,
            "tty": true,
            "securityContext": {
              "privileged": true
            }
          }
        ]
      }
    }' --attach "$@"
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
