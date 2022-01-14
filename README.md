# lilithmooncohen dotfiles
These are my dotfiles for setting up my development environment. I use them to configure both my local machine and any jump host or development server that I use.

## Grab the dotfiles
```
# Clone the repo
git clone --recursive https://github.com/lilithmooncohen/dotfiles.git ~/.dotfiles
```

## Install rust, upgrade pip, and install ansible
```
curl https://sh.rustup.rs -sSf | sh -s -- -y
pip install --upgrade pip
pip install ansible
```

## OS Specific Prep

### Mac
```
~/.dotfiles/helpers/install/mac-bootstrap.sh
```

### Debian / Ubuntu
```
~/.dotfiles/helpers/install/ubuntu-bootstrap.sh
```

## Install dependencies
```
yarn global add \
  bash-language-server \
  dockerfile-language-server-nodejs \
  eslint-cli \
  import-js \
  typescript-language-server \
  neovim \
  tern \
  typescript \
  vmd

go install golang.org/x/tools/gopls@latest

pip3 install \
  neovim \
  pynvim \
  websocket-client \
  sexpdata \
  python-language-server

```

## Initialize Dotfiles
### If any of the following exist, back them up and remove them
```
.dotfiles/
.config/terminator/config
.gitconfig
.oh_my_zsh/
.profile
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
mkdir -p ~/.config
mkdir -p ~/.cache/vimfiles/repos/github.com/Shougo
mkdir -p ~/.config/Code/User
mkdir -p ~/Library/Application\ Support/Code
mkdir -p ~/.code-server/User
ln -s ~/.dotfiles/src/github/Shougo/dein.vim ~/.cache/vimfiles/repos/github.com/Shougo/dein.vim
ln -s ~/.dotfiles/config/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/config/tmux ~/.tmux
ln -s ~/.dotfiles/config/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/config/shell/.profile ~/.profile
ln -s ~/.dotfiles/config/shell/.zshrc ~/.zshrc
ln -s ~/.dotfiles/config/shell/.bashrc ~/.bashrc
ln -s ~/.dotfiles/src/github/robbyrussell/oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.SpaceVim
ln -s ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.vim
ln -s ~/.dotfiles/src/github/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/.dotfiles/config/spacemacs/.spacemacs ~/.spacemacs
ln -s ~/.dotfiles/config/base16/vim/.vimrc_background ~/.vimrc_background
ln -s ~/.dotfiles/src/github/SpaceVim/SpaceVim ~/.config/nvim
ln -s ~/.dotfiles/config/spacevim/ ~/.SpaceVim.d
ln -s ~/.dotfiles/config/vscode/settings.json ~/.config/Code/User/settings.json
ln -s ~/.dotfiles/config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/.dotfiles/config/vscode/snippets ~/.config/Code/User/
ln -s ~/.config/Code/User ~/Library/Application\ Support/Code/User
ln -s ~/.dotfiles/config/vscode/settings.json ~/.code-server/User/settings.json
ln -s ~/.dotfiles/config/vscode/keybindings.json ~/.code-server/User/keybindings.json
ln -s ~/.dotfiles/config/vscode/snippets ~/.code-server/User/
ln -s ~/.dotfiles/config/terminator/config ~/.config/terminator/config

source ~/.profile

# Change default shell
chsh -s /bin/zsh
```

### Install fonts

```
mkdir -p ~/.local/share/fonts
cp ~/.dotfiles/src/local/fonts/* ~/.local/share/fonts
```

#### Mac
```
cp ~/.local/share/fonts/* ~/Library/Fonts/
```

#### Linux
```
fc-cache -fv > /dev/null
mkfontdir "~/.local/share/fonts" > /dev/null
mkfontscale "~/.local/share/fonts" > /dev/null
```

## Update
To update all submodules, do the following:
```
export DOTFILES_PATH="~/.dotfiles"
cd ~/.dotfiles
git pull
git submodule update --init --recursive && git submodule update --recursive --remote
```
