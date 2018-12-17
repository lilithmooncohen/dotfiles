# ryanckoch dotfiles
These are my dotfiles for setting up zsh, tmux, and spacevim. I use them to configure both my local machine and any jump host or development server that I use.

## OS Specific Prep

### Mac
```
brew install \
    go \
    neovim \
    python \
    python@2 \
    yarn \
    vim \
    zsh
```

### Debian / Ubuntu
```
sudo apt-get install -y \
	curl \
	locales \
	software-properties-common

# Set locale
sudo locale-gen en_US.UTF-8
sudo update-locale \
	LANG="en_US.UTF-8" \
	LANGUAGE="en_US:en" \
	LC_NUMERIC="en_US.UTF-8" \
	LC_TIME="en_US.UTF-8" \
	LC_MONETARY="en_US.UTF-8" \
	LC_PAPER="en_US.UTF-8" \
	LC_IDENTIFICATION="en_US.UTF-8" \
	LC_NAME="en_US.UTF-8" \
	LC_ADDRESS="en_US.UTF-8" \
	LC_TELEPHONE="en_US.UTF-8" \
	LC_MEASUREMENT="en_US.UTF-8"

# Add go repo
sudo add-apt-repository -y ppa:longsleep/golang-backports

# Add yarn repo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

# Install dependencies
sudo apt-get install -y \
	bash \
	build-essential \
	ctags \
	erlang-xmerl \
  git \
	golang-go \
	jq \
	neovim \
	python-dev \
	python-pip \
	python3-dev \
	python3-pip \
	ruby \
  tmux \
	vim-nox \
  yarn \
  zsh
```

## Install dependencies
```
yarn global add \
	import-js \
	bash-language-server \
	dockerfile-language-server-nodejs \
	javascript-typescript-langserver \
    neovim \
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
.oh_my_zsh/
.SpaceVim/
.SpaceVim.d/
.tmux/
.tmux.conf
.vim/
.vimrc
.zshrc
```

### Install dotfiles
```
export DOTFILES_PATH="$HOME/.dotfiles"

# Clone the repo
git clone --recursive https://github.com/ryanckoch/dotfiles.git $DOTFILES_PATH

# Install needed fonts
cd $DOTFILES_PATH/src/github/powerline/fonts
./install.sh
cd $DOTFILES_PATH

# Create symlinks
mkdir -p $HOME/.cache/vimfiles/repos/github.com/Shougo
ln -s $DOTFILES_PATH/src/github/Shougo/dein.vim $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim
ln -s $DOTFILES_PATH/config/tmux $HOME/.tmux
ln -s $DOTFILES_PATH/config/tmux/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_PATH/config/zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_PATH/src/github/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.SpaceVim
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.vim
ln -s $DOTFILES_PATH/src/github/SpaceVim/SpaceVim $HOME/.config/nvim
ln -s $DOTFILES_PATH/config/spacevim/ $HOME/.SpaceVim.d

# Change default shell
chsh -s /bin/zsh
```

## Update
To update all submodules, do the following:
```
export DOTFILES_PATH="$HOME/.dotfiles"
cd $DOTFILES_PATH
git submodule update --init --recursive
```
