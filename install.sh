#!/usr/bin/env bash

set -ex

./bootstrap.sh

dotbot -c install.conf.yaml
