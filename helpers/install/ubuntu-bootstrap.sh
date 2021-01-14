#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install pip3 if not installed
if ! command -v pip3 >/dev/null 2>&1; then
    sudo apt-get install python3-pip
fi

# install ansible via pip if not installed
if ! command -v ansible >/dev/null 2>&1; then
    pip3 install --user ansible
fi

# run ansible playbook
ansible-playbook ${SCRIPTDIR}/ubuntu.yml --ask-become-pass
