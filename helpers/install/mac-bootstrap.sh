#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install xcode if not installed
xcode-select --install || true

# global pre-install
${SCRIPTDIR}/global-pre-install.sh
source ~/.profile

# install brew if not installed
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install libjpeg openblas openssl readline sqlite3 xz zlib cmake
    source ~/.profile
fi

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
ansible-playbook ${SCRIPTDIR}/mac.yml
source ~/.profile

# install all asdf
asdf install
source ~/.profile

# global post install
${SCRIPTDIR}/global-post-install.sh
source ~/.profile
