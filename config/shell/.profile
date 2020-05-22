# ~/.profile: executed by Bourne-compatible login shells.

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then . "$HOME/.bashrc"; fi
elif [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then . "$HOME/.zshrc"; fi
fi
