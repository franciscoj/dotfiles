# Load linuxbrew if it exists
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -v CODESPACES ] ; then
  alias xdg-open="rdm open"
  gh config set browser "rdm open"
fi
