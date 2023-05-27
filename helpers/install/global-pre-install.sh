#!/bin/bash

set -e

# bash shell config
ln -sfn ~/.dotfiles/config/shell/.profile ~/.profile
ln -sfn ~/.dotfiles/config/shell/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/config/shell/.bashrc ~/.bashrc
ln -sfn ~/.dotfiles/config/asdf/.tool-versions ~/.tool-versions

# Ensure needed directories exist
mkdir -p ~/.config
mkdir -p ~/.cache/vimfiles/repos/github.com/Shougo
mkdir -p ~/.config/Code/User
mkdir -p ~/Library/Application\ Support/Code
mkdir -p ~/.code-server/User
mkdir -p ~/.config/terminator

# create remaining symlinks
ln -sfn ~/.dotfiles/src/github/Shougo/dein.vim ~/.cache/vimfiles/repos/github.com/Shougo/dein.vim
ln -sfn ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/config/tmux ~/.tmux
ln -sfn ~/.dotfiles/config/tmux/tmux.conf ~/.tmux.conf
ln -sfn ~/.dotfiles/config/asdf/.tool-versions ~/.tool-versions
ln -sfn ~/.dotfiles/src/github/robbyrussell/oh-my-zsh ~/.oh-my-zsh
ln -sfn ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.SpaceVim
ln -sfn ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.vim
ln -sfn ~/.dotfiles/src/github/syl20bnr/spacemacs ~/.emacs.d
ln -sfn ~/.dotfiles/config/spacemacs/.spacemacs ~/.spacemacs
ln -sfn ~/.dotfiles/config/base16/vim/.vimrc_background ~/.vimrc_background
ln -sfn ~/.dotfiles/src/github/chriskempson/base16-shell ~/.config/base16-shell
ln -sfn ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.config/nvim
ln -sfn ~/.dotfiles/config/spacevim/ ~/.SpaceVim.d
ln -sfn ~/.dotfiles/config/vscode/settings.json ~/.config/Code/User/settings.json
ln -sfn ~/.dotfiles/config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -sfn ~/.dotfiles/config/vscode/snippets ~/.config/Code/User/
ln -sfn ~/.config/Code/User ~/Library/Application\ Support/Code/User
ln -sfn ~/.dotfiles/config/vscode/settings.json ~/.code-server/User/settings.json
ln -sfn ~/.dotfiles/config/vscode/keybindings.json ~/.code-server/User/keybindings.json
ln -sfn ~/.dotfiles/config/vscode/snippets ~/.code-server/User/
ln -sfn ~/.dotfiles/config/terminator/config ~/.config/terminator/config
