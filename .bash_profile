export CLICOLOR=1
export TERM=xterm-256color
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PS1='\w\[\033[32m\]$(parse_git_branch)\[\033[00m\] $ '

# Helpful Aliases

alias ll="ls -l"
alias ..="cd .."
alias nw="npm run watch"
alias g="git"

# Color man pages

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Git branch in prompt.

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

# Docker
eval "$(docker-machine env default)"
