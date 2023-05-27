SHELL="$(which zsh)"
DOTFILES="${DOTFILES:=$HOME/.dotfiles}"
DOTFILES_SHELL_DIR="${DOTFILES_SHELL_DIR:=$DOTFILES/config/shell}"

# zsh env
if [ -f "$DOTFILES_SHELL_DIR/.zshenv" ]; then . "$DOTFILES_SHELL_DIR/.zshenv"; fi

# zsh aliases
if [ -f "$DOTFILES_SHELL_DIR/.zsh_aliases" ]; then . "$DOTFILES_SHELL_DIR/.zsh_aliases"; fi

# global rc
if [ -f "$DOTFILES_SHELL_DIR/.globalrc" ]; then . "$DOTFILES_SHELL_DIR/.globalrc"; fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"
ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_UPDATE="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

prompt_dir() {
    prompt_segment blue black "`basename ${PWD##*/}`"
}

# asdf autocomplete
if [ -d "${ASDF_DIR}" ]; then
  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
fi

if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

