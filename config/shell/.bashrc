SHELL="$(which bash)"
DOTFILES="${DOTFILES:=$HOME/.dotfiles}"
DOTFILES_SHELL_DIR="${DOTFILES_SHELL_DIR:=$DOTFILES/config/shell}"

# bash env
if [ -f "$DOTFILES_SHELL_DIR/.bashenv" ]; then . "$DOTFILES_SHELL_DIR/.bashenv"; fi

# bash aliases
if [ -f "$DOTFILES_SHELL_DIR/.bash_aliases" ]; then . "$DOTFILES_SHELL_DIR/.bash_aliases"; fi

# global rc
if [ -f "$DOTFILES_SHELL_DIR/.globalrc" ]; then . "$DOTFILES_SHELL_DIR/.globalrc"; fi

# Ghostty shell integration for Bash.
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# asdf autocomplete
if [ -d "${ASDF_DIR}" ]; then . $ASDF_DIR/completions/asdf.bash; fi

if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
