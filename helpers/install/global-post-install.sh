#!/bin/bash

set -e

# go settings
mkdir -p "$(dirname "$(go env GOENV)")"
ln -sfn ~/.dotfiles/config/go/env "$(go env GOENV)"

# vim lsp dependencies
npm install -g \
 bash-language-server \
 dockerfile-language-server-nodejs \
 yaml-language-server
#  eslint-cli \
#  import-js \
#  typescript-language-server \
#  neovim \
#  tern \
#  typescript \
#  vmd \

go install golang.org/x/tools/gopls@latest

pip install \
  neovim \
  pynvim \
  websocket-client \
  sexpdata \
  python-language-server

# krew plugins
krew install \
  cnpg \
  node-admin \
  pod-lens \
  sniff
