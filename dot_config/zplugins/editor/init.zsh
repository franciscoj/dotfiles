export EDITOR='nvim'
export VISUAL='code -w'

export DIFFPROG='nvim -d'
export MANPAGER='nvim +Man!'

alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias vi='$EDITOR'

# Use emacs-style zsh bindings
bindkey -e
# `CTRL-X E` to edit the current line with $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
