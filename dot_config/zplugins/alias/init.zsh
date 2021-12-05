# vim: set ft=sh

alias _="sudo"
alias rake="noglob rake"

alias tmux="tmux -u"


if ! command -v exa &> /dev/null
then
  alias ll="ls -lh"
  alias la="ls -lha"
else
  exa_params=('--git' '--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')
  alias ll="exa -lh ${exa_params}"
  alias la="exa -lha ${exa_params}"
fi

alias be="bundle exec"
alias path='echo -e ${PATH//:/\\n}'
