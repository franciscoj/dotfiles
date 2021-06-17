#!/bin/sh

set -ex

# TODO: Finetune this so that the bare-minimum is installed through this
xargs -a codespaces_packages_list sudo apt-get install -y
chsh -s /bin/zsh root

# Install linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Use linuxbrew to install anything else :)
brew bundle --file=Brewfile.codespaces
