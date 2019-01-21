export PATH="$HOME/google-cloud-sdk/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.yarn/bin:$HOME/.local/bin:$PATH"
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export GTAGSLABEL="pygments"

alias vim='nvim'

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/src/github/chriskempson/base16-shell"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

