#!/bin/sh

set -ex

if [[ -f /workspaces/.codespaces/.persistedshare/dotfiles/README.md ]]; then
  echo "Skipping yay in Codespaces"
else
  yay_folder=$HOME/yay-$RANDOM
  yay_aur_git=https://aur.archlinux.org/yay.git

  if [ ! -x "$(command -v yay)" ]; then
    git clone $yay_aur_git $yay_folder
    cd $yay_folder
    makepkg -si

    cd -

    rm -rf $yay_folder
  fi
fi
