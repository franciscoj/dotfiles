export EDITOR='nvim'
export DIFFPROG='nvim -d'
export MANPAGER='nvim +Man!'

export VISUAL=$EDITOR

alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias vi='$EDITOR'

# But still use emacs-style zsh bindings
bindkey -e
