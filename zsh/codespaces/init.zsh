if [[ -f /workspaces/.codespaces/.persistedshare/dotfiles/README.md ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
  source $ZPLUG_HOME/init.zsh
fi
