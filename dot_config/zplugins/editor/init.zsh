alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias vi='$EDITOR'
alias nvim='lvim'

# Use emacs-style zsh bindings
bindkey -e
# `CTRL-X E` to edit the current line with $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

export EDITOR='lvim'
export VISUAL='lvim'

export DIFFPROG='nvim -d'
export MANPAGER='nvim +Man!'

