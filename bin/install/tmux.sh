#!/bin/sh
set -ex

tpm_git=https://github.com/tmux-plugins/tpm
tpm_home=$HOME/.tmux/plugins/tpm

if [ ! -d "$tpm_home" ]; then
  git clone $tpm_git $tpm_home
fi

