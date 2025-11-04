set fish_greeting

alias rm='trash'
alias vim='nvim'
alias open='xdg-open'
alias ip='ip --color'
alias grep='grep --color=auto'

fish_add_path '~/.local/bin/'
fish_add_path '~/.npm/bin/'

export EDITOR=nvim
export PAGER=less
export TERM=xterm-256color
export GOPATH=$HOME/.go
export GOPROXY=https://goproxy.cn,direct
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)

    set -l delim '$ '

    fish_is_root_user; and set delim "# "

    # Prompt status only if it's not 0
    set -l prompt_status
    test $last_status -ne 0
    and set prompt_status (set_color $fish_color_status)'['$last_status']'$normal
    and set delim (set_color red)$delim$normal
    or set delim (set_color green)$delim$normal

    # Shorten pwd if prompt is too long
    set -l pwd (set_color cyan)'['(prompt_pwd)']'$normal

    echo -n -s $pwd $prompt_status $delim
end

function fish_right_prompt
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_use_informative_chars 1
    set -g __fish_git_prompt_char_dirtystate '*'
    set -g __fish_git_prompt_char_untrackedfiles '?'

    set -l vcs (fish_vcs_prompt '[git:%s]' 2>/dev/null)

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and set -l venv '[py:'(string replace -r '.*/' '' -- "$VIRTUAL_ENV")']'

    set_color normal
    string join "" -- $venv $vcs
end
