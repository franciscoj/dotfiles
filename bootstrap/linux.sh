#!/bin/sh

set -ex

# Install yay
./bin/install/yay.sh

# Install base system packages
yay -S --needed - < arch_packages_list

# Install custom system configuration
cd system
makepkg -di
cd ..
