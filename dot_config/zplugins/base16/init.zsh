# Use base16 to setup terminal colors everywhere.

BASE16_SCHEME="dracula"
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-$BASE16_SCHEME.sh"
if [[ -s $BASE16_SHELL ]]; then
  . $BASE16_SHELL
fi

