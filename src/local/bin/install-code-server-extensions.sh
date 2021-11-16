#!/bin/bash

set -e

TMP_DIR="/tmp/vsextensions"

install_extension () {
    set -e

    PKG_PUBLISHER="$1"
    PKG_NAME="$2"
    PKG_VERSION="$3"

    mkdir -p ${TMP_DIR}

    if [ ! -f ${TMP_DIR}/${PKG_PUBLISHER}.${PKG_NAME}-${PKG_VERSION}.vsix ]; then
        curl -L \
            -o ${TMP_DIR}/${PKG_PUBLISHER}.${PKG_NAME}-${PKG_VERSION}.vsix.gz \
            https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${PKG_PUBLISHER}/vsextensions/${PKG_NAME}/${PKG_VERSION}/vspackage

        gunzip ${TMP_DIR}/${PKG_PUBLISHER}.${PKG_NAME}-${PKG_VERSION}.vsix.gz -f
    fi

    code-server \
        --config ~/app/code-server/local/lilithmooncohen/config.yaml \
        --user-data-dir ~/app/code-server/local/lilithmooncohen/user-data \
        --proxy-domain lily.ide.galaxy.stratospire.com \
        --install-extension ${TMP_DIR}/${PKG_PUBLISHER}.${PKG_NAME}-${PKG_VERSION}.vsix \
        --force
}

install_extension GitHub copilot 1.5.3340
install_extension bodil file-browser 0.2.10
install_extension VSpaceCode whichkey 0.9.3
install_extension jacobdufault fuzzy-search 0.0.3
#install_extension ms-toolsai jupyter-keymap 1.0.0
#install_extension ms-toolsai jupyter-renderers 1.0.3
install_extension kahole magit 0.6.23
#install_extension ms-vscode-remote remote-containers 0.202.5
#install_extension ms-vscode-remote remote-ssh 0.65.8
#install_extension ms-vscode-remote remote-ssh-edit 0.65.8
#install_extension ms-vscode-remote remote-wsl 0.58.2
install_extension vscodevim vim 1.21.8
install_extension redhat vscode-commons 0.0.6
install_extension ms-python vscode-pylance 2021.10.2
install_extension VSpaceCode vspacecode 0.10.3
