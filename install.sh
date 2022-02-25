#!/bin/sh

set -e # -e: exit on error

if [ -z "${CODESPACES}" ]; then
  echo "not codespaces"
else
  sudo apt install -y ripgrep

  if [ ! "$(command -v chezmoi)" ]; then
    echo "Installing: chezmoi ********************"

    bin_dir="$HOME/.local/bin"
    chezmoi="$bin_dir/chezmoi"
    if [ "$(command -v curl)" ]; then
      sh -c "$(curl -fsSL chezmoi.io/get)" -- -b "$bin_dir"
    elif [ "$(command -v wget)" ]; then
      sh -c "$(wget -qO- chezmoi.io/get)" -- -b "$bin_dir"
    else
      echo "To install chezmoi, you must have curl or wget installed." >&2
      exit 1
    fi
  else
    chezmoi=chezmoi
  fi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=$script_dir"
