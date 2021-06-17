#!/usr/bin/env bash

set -x

is_wsl=$(uname -a | grep WSL)
is_arch=$(uname -a | grep arch)

if [ -n "$is_wsl" ]; then
    ./bootstrap/wsl.sh
    dotbot -c install.conf.yaml
elif [ -n "$is_arch" ]; then
    ./bootstrap/arch.sh
    dotbot -c install.conf.yaml
elif [ -n "$CODESPACES" ]; then
    ./bootstrap/codespaces.sh
fi
