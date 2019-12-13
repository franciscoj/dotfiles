# Activate hub, which decorates the `git` command
[[ -x "$(command -v hub)" ]] && eval "$(hub alias -s)"

# Load asdf completions if they exist
[[ -d "$HOME/.asdf" ]] && source $HOME/.asdf/completions/asdf.bash

# Load fzf into zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


