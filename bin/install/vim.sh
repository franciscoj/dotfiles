#!/bin/sh

set -ex

if [ -n "$CODESPACES" ]; then
  cd ~/
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  ln -sf nvim.appimage /usr/bin/nvim
  cd -
fi

plug_url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
plug_dst=$HOME/.config/nvim/autoload/plug.vim

if [ ! -f "$plug_dst" ]; then
  curl -fLo $plug_dst $plug_url
  nvim +PlugInstall +qa

  mkdir -p $HOME/.config/nvim/files/backup
fi
