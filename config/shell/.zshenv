# global env
if [ -f "$DOTFILES_SHELL_DIR/.globalenv" ]; then . "$DOTFILES_SHELL_DIR/.globalenv"; fi

# zsh specific env
HISTFILE="${HOME}/.zsh_history"
