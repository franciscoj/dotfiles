#!/bin/sh

set -ex

# Install base system packages
xargs -a wsl_packages_list sudo apt-get install
