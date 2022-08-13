# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# nvm
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[magenta]%}[nvm:"
ZSH_THEME_NVM_PROMPT_SUFFIX="]%{$reset_color%}"

# rvm
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}[rvm:"
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# virtualenv
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[yellow]%}[py:"
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

# kube
KUBE_PS1_SYMBOL_DEFAULT="k8s:"
KUBE_PS1_PREFIX="%{$fg[blue]%}["
KUBE_PS1_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"
KUBE_PS1_SEPARATOR=""
KUBE_PS1_DIVIDER=""

# Combine it all into a final right-side prompt
RPS1=''
RPS1+='%n@%m '
RPS1+='$(git_prompt_info)'
RPS1+='$(virtualenv_prompt_info)'
# RPS1+='$(nvm_prompt_info)'
# RPS1+='$(ruby_prompt_info)'
# RPS1+='$(kube_ps1)'
RPS1+='$EPS1'

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '


