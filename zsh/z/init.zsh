# Use `j` for the command instead of `z`
export _Z_CMD="j"

# On linux
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# On mac with homebrew
[[ -r "/usr/local/etc/profile.d/z.sh" ]] && source /usr/local/etc/profile.d/z.sh

# On codespaces with linuxbrew
[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/z.sh" ]] && source /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
