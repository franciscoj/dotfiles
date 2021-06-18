#!/bin/sh
set -ex

if [[ -n "$CODESPACES" ]]; then
  echo "Skipping tmux plugins on codespaces"
else
  tpm_git=https://github.com/tmux-plugins/tpm
  tpm_home=$HOME/.tmux/plugins/tpm

  if [ ! -d "$tpm_home" ]; then
    git clone $tpm_git $tpm_home
  fi
fi

