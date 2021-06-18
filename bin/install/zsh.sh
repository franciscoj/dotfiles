#!/bin/sh
set -ex

# Don't install zplug on codespaces
if [[ -f /workspaces/.codespaces/.persistedshare/dotfiles/README.md ]]; then
  echo "Skipping zplug on Codespaces"

  base16_home=$HOME/.config/base16-shell
  base16_git=https://github.com/chriskempson/base16-shell.git

  if [ ! -d "$base16_home" ]; then
    git clone $base16_git $base16_home
  fi
else
  zplug_home=$HOME/.config/zplug
  zplug_git=https://github.com/zplug/zplug

  if [ ! -d "$zplug_home" ]; then 
    git clone $zplug_git $zplug_home
  fi

  base16_home=$HOME/.config/base16-shell
  base16_git=https://github.com/chriskempson/base16-shell.git

  if [ ! -d "$base16_home" ]; then
    git clone $base16_git $base16_home
  fi
fi
