#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install xcode if not installed
xcode-select --install || true

# install brew if not installed
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install python via homebrew if not installed
if ! brew ls --versions python >/dev/null 2>&1; then
    brew install python
fi

# install ansible via pip if not installed
if ! command -v ansible >/dev/null 2>&1; then
    pip3 install --user ansible
fi

# run ansible playbook
ansible-playbook ${SCRIPTDIR}/mac.yml
