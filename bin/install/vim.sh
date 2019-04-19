#!/bin/sh

set -ex

plug_url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
plug_dst=~/.config/nvim/autoload/plug.vim

if [ ! -f $plug_dst ]; then
  curl -fLo $plug_dst $plug_url
  nvim +PlugInstall +qa

  mkdir -p ~/.config/nvim/files/backup
fi
