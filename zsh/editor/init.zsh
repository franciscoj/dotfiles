export EDITOR='nvim'
export DIFFPROG='nvim -d'

export VISUAL=$EDITOR

alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias vi='$EDITOR'

# Edit lines on the shell with vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
