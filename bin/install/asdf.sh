#!/bin/sh
set -ex

if [[ -f /workspaces/.codespaces/.persistedshare/dotfiles/README.md ]]; then
  echo "Skipping ASDF"
elif [ ! -d "$asdf_home" ]; then
  asdf_home=$HOME/.asdf
  asdf_git=https://github.com/asdf-vm/asdf.git

  git clone $asdf_git $asdf_home
  cd $asdf_home
  git checkout "$(git describe --abbrev=0 --tags)"
fi
