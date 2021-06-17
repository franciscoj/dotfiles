#!/bin/sh

set -ex

xargs -a codespaces_packages_list sudo apt-get install -y
chsh -s /bin/zsh root

# Install linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Use linuxbrew to install anything else :)
brew bundle --file=Brewfile.codespaces

pip3 install --user dotbot
