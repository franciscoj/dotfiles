# vim: set ft=sh

alias _="sudo"
alias rake="noglob rake"

alias tmux="tmux -u"


if ! command -v eza &> /dev/null
then
  alias ll="ls -lh"
  alias la="ls -lha"
else
  eza_params=('--icons' '--classify' '--group-directories-first' '--time-style=long-iso' '--group' '--color-scale')
  alias ll="eza -lh ${eza_params}"
  alias la="eza -lha ${eza_params}"
fi

alias be="bundle exec"
alias path='echo -e ${PATH//:/\\n}'
