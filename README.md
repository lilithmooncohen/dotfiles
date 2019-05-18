# ryanckoch dotfiles
These are my dotfiles for setting up my development environment. I use them to configure both my local machine and any jump host or development server that I use.

## Grab the dotfiles
```
export DOTFILES_PATH="$HOME/.dotfiles"

# Clone the repo
git clone --recursive https://github.com/ryanckoch/dotfiles.git $DOTFILES_PATH
cd $DOTFILES_PATH
```

## Install pip and Ansible
```
sudo pip install ansible
```

## OS Specific Prep

### Mac
```
brew install \
    go \
    neovim \
    python \
    python@2 \
    tmux \
    yarn \
    vim \
    zsh
brew install global --with-pygments --with-ctags
brew cask install powershell
```

### Debian / Ubuntu
```
ansible-playbook helpers/install/ubuntu.yml --ask-sudo-pass
```

## Install dependencies
```
curl https://sh.rustup.rs -sSf | sh -s -- -y

yarn global add \
  bash-language-server \
  dockerfile-language-server-nodejs \
  eslint-cli \
  import-js \
  javascript-typescript-langserver \
  neovim \
  tern \
  typescript

go get -u github.com/sourcegraph/go-langserver

pip install \
	neovim \
	python-language-server && \
pip3 install \
	neovim \
	python-language-server
```

## Initialize Dotfiles
### If any of the following exist, back them up and remove them
```
.dotfiles/
.config/terminator/config
.oh_my_zsh/
.profile
.zshenv
.zprofile
.bash_profile
.bashrc
.SpaceVim/
.SpaceVim.d/
.tmux/
.tmux.conf
.vim/
.vimrc
.vimrc_background
.zshrc
```

### Install dotfiles
```
# Create symlinks
mkdir -p $HOME/.config
mkdir -p $HOME/.cache/vimfiles/repos/github.com/Shougo
mkdir -p $HOME/.config/Code/User
mkdir -p $HOME/Library/Application\ Support/Code
mkdir -p $HOME/.code-server/User
ln -s $DOTFILES_PATH/src/github/Shougo/dein.vim $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim
ln -s $DOTFILES_PATH/config/tmux $HOME/.tmux
ln -s $DOTFILES_PATH/config/tmux/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_PATH/config/zsh/zshenv $HOME/.zshenv
ln -s $DOTFILES_PATH/config/zsh/zprofile $HOME/.zprofile
ln -s $DOTFILES_PATH/config/zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_PATH/config/bash/bash_profile $HOME/.bash_profile
ln -s $DOTFILES_PATH/config/bash/bashrc $HOME/.bashrc
ln -s $DOTFILES_PATH/src/github/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.SpaceVim
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.vim
ln -s $DOTFILES_PATH/src/github/syl20bnr/spacemacs $HOME/.emacs.d
ln -s $DOTFILES_PATH/config/spacemacs/.spacemacs $HOME/.spacemacs
ln -s $DOTFILES_PATH/config/base16/vim/.vimrc_background $HOME/.vimrc_background
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.config/nvim
ln -s $DOTFILES_PATH/config/spacevim/ $HOME/.SpaceVim.d
ln -s $DOTFILES_PATH/config/vscode/settings.json $HOME/.config/Code/User/settings.json
ln -s $DOTFILES_PATH/config/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s $DOTFILES_PATH/config/vscode/snippets $HOME/.config/Code/User/
ln -s $HOME/.config/Code/User $HOME/Library/Application\ Support/Code/User
ln -s $DOTFILES_PATH/config/vscode/settings.json $HOME/.code-server/User/settings.json
ln -s $DOTFILES_PATH/config/vscode/keybindings.json $HOME/.code-server/User/keybindings.json
ln -s $DOTFILES_PATH/config/vscode/snippets $HOME/.code-server/User/
ln -s $DOTFILES_PATH/config/terminator/config $HOME/.config/terminator/config

# Change default shell
chsh -s /bin/zsh
```

### Install fonts

```
mkdir -p $HOME/.local/share/fonts
cp $DOTFILES_PATH/src/local/fonts/* $HOME/.local/share/fonts
```

#### Mac
```
cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
```

#### Linux
```
fc-cache -fv > /dev/null
mkfontdir "$HOME/.local/share/fonts" > /dev/null
mkfontscale "$HOME/.local/share/fonts" > /dev/null
```

## Update
To update all submodules, do the following:
```
export DOTFILES_PATH="$HOME/.dotfiles"
cd $DOTFILES_PATH
git pull
git submodule update --init --recursive
```
