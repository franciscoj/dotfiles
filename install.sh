#!/usr/bin/env bash

set -ex

./bootstrap.sh

is_wsl=$(uname -a | grep WSL)
is_arch=$(uname -a | grep arch)

if [ -n "$is_wsl" ]; then
    ./bootstrap/wsl.sh
    dotbot -c install.conf.yaml
elif [ -n "$is_arch" ]; then
    ./bootstrap/arch.sh
    dotbot -c install.conf.yaml
elif [ -n "$CODESPACES_INSTALL" ]; then
    export CODESPACES=1
    ./bootstrap/codespaces.sh
    dotbot -c install.conf.yaml
fi
