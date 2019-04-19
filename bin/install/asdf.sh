#!/bin/sh
set -ex

asdf_home=$HOME/.asdf
asdf_git=https://github.com/asdf-vm/asdf.git

if [ ! -d "$asdf_home" ]; then
  git clone $asdf_git $asdf_home
  cd $asdf_home
  git checkout "$(git describe --abbrev=0 --tags)"
fi
