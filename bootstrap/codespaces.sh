#!/bin/sh

set -e

xargs -a codespaces_packages_list sudo apt-get install -y
chsh -s /bin/zsh root

# Install linuxbrew
CI=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
CI=
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Use linuxbrew to install anything else :)
brew bundle --file=Brewfile.codespaces

pip3 install dotbot
pip3 install pynvim
