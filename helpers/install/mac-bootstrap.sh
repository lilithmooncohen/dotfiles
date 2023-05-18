#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install xcode if not installed
xcode-select --install || true

# install brew if not installed
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install libjpeg openblas openssl readline sqlite3 xz zlib cmake
fi

# install ansible-playboook if not installed
if ! command -v ansible-playbook >/dev/null 2>&1; then
    asdf plugin add github.com/danhper/asdf-python.git
    asdf install python
    source ~/.profile
    pip install ansible
fi

# run ansible playbook
ansible-playbook ${SCRIPTDIR}/mac.yml
