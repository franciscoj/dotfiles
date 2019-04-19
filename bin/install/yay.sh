#!/bin/sh

set -ex

if [ ! -x "$(command -v yay)" ]; then
  git clone https://aur.archlinux.org/yay.git $HOME/yay
  cd yay
  makepkg -si
fi
