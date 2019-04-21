#!/bin/sh
set -ex

if [ -d /sys/class/power_supply/BAT1 ]; then
  /usr/bin/cbatticon
fi
