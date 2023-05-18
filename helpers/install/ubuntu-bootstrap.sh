#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# global pre-install
${SCRIPTDIR}/global-pre-install.sh
source ~/.profile

# install asdf, python, and ansible dependencies
if command -v sudo >/dev/null 2>&1; then
    sudo apt update && \
    sudo apt install -y \
        build-essential \
        curl \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        tk-dev \
        unzip \
        xz-utils \
        zlib1g-dev
else
    apt update && \
    apt install -y \
        build-essential \
        curl \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        tk-dev \
        unzip \
        xz-utils \
        zlib1g-dev
fi
source ~/.profile

# install asdf plugins
${SCRIPTDIR}/asdf-plugin-add.sh || true

# install asdf python if not installed
if [[ $(which python3) != *"asdf"* ]];then
    echo "Installing python from asdf"
    asdf install python
    source ~/.profile
fi

# install ansible-playboook if not installed
if ! command -v ansible-playbook >/dev/null 2>&1; then
    echo "Installing ansible from pip"
    pip install ansible
    source ~/.profile
fi

# run ansible playbook
if command -v sudo >/dev/null 2>&1; then
    ansible-playbook ${SCRIPTDIR}/ubuntu.yml --ask-become-pass
else
    ansible-playbook ${SCRIPTDIR}/ubuntu.yml
fi
source ~/.profile


# install all asdf
asdf install
source ~/.profile

# global post install
${SCRIPTDIR}/global-post-install.sh
source ~/.profile
