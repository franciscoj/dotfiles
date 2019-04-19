#!/bin/sh

set -ex

./bin/install/yay.sh

yay -S --needed - < arch_packages_list

cd system
makepkg -di
cd ..
