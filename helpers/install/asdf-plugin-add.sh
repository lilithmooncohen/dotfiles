#!/bin/bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

file="${SCRIPTDIR}/../../config/asdf/plugin-list.txt"
while read -r line; do
PLUGIN_NAME="$(echo $line | awk '{print $1}')"
PLUGIN_URL="$(echo $line | awk '{print $2}')"
asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_URL}"
done <$file
