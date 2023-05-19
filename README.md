# lilithmooncohen dotfiles
These are my dotfiles for setting up my development environment. I use them to configure both my local machine and any jump host or development server that I use.

## Grab the dotfiles
```shell
git clone --recursive https://github.com/lilithmooncohen/dotfiles.git ~/.dotfiles
```

## OS Specific Install

### Mac
```shell
~/.dotfiles/helpers/install/mac-bootstrap.sh
source ~/.profile
```

### Debian / Ubuntu
```shell
~/.dotfiles/helpers/install/ubuntu-bootstrap.sh
source ~/.profile
```

## Change default shell
```shell
chsh -s /bin/zsh
```

## Install fonts

```
mkdir -p ~/.local/share/fonts
cp ~/.dotfiles/src/local/fonts/* ~/.local/share/fonts
```

### Mac
```
cp ~/.local/share/fonts/* ~/Library/Fonts/
```

### Linux
```
fc-cache -fv > /dev/null
mkfontdir "~/.local/share/fonts" > /dev/null
mkfontscale "~/.local/share/fonts" > /dev/null
```

## Update
To update all submodules, do the following:
```
cd ~/.dotfiles
git pull
git submodule update --init --recursive && git submodule update --recursive --remote
```
