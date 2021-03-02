#!/bin/sh

set -x

is_wsl=$(uname -a | grep WSL)
is_arch=$(uname -a | grep arch)

if [ -n "$is_wsl" ]
then
    ./bootstrap/wsl.sh
elif [-n "$is_arch" ]
then
    ./bootstrap/arch.sh
fi
