#!/bin/sh
# Extracted from: http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html#usage
# Usage:
#  ./vid2gif file.mp4 file.gif

set -ex

palette="/tmp/palette.png"

filters="fps=15,scale=640:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
