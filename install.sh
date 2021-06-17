#!/usr/bin/env bash

set -ex

./bootstrap.sh

is_wsl=$(uname -a | grep WSL)
is_arch=$(uname -a | grep arch)

if [ -n "$is_wsl" ]; then
    ./bootstrap/wsl.sh
elif [ -n "$is_arch" ]; then
    ./bootstrap/arch.sh
elif [ -n "$CODESPACES" ]; then
    ./bootstrap/codespaces.sh
fi

dotbot -c install.conf.yaml
