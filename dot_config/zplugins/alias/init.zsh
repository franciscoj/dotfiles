# vim: set ft=sh

alias _="sudo"
alias rake="noglob rake"

alias tmux="tmux -u"


if ! command -v exa &> /dev/null
then
  alias ll="ls -lh"
  alias la="ls -lha"
else
  alias ll="exa -lh"
  alias la="exa -lha"
fi

alias be="bundle exec"
