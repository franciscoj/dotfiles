export EDITOR='nvim'
export DIFFPROG='nvim -d'

export VISUAL=$EDITOR

alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias vi='$EDITOR'

