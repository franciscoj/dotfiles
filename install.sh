#!/usr/bin/env bash

set -ex

./bootstrap.sh

CONFIG="install.conf.yaml"

dotbot -c "${CONFIG}"
