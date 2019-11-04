#!/bin/sh

set -ex

yay_folder=$HOME/yay-$RANDOM
yay_aur_git=https://aur.archlinux.org/yay.git

if [ ! -x "$(command -v yay)" ]; then
  git clone $yay_aur_git $yay_folder
  cd $yay_folder
  makepkg -si

  cd -

  rm -rf $yay_folder
fi
