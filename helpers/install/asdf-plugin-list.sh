#!/bin/bash

set -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

asdf plugin list --urls > ${SCRIPTDIR}/../../config/asdf/plugin-list.txt
