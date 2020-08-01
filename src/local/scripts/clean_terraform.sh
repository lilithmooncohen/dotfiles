#!/usr/bin/env bash

find . -name ".terraform" -type d -prune -exec rm -rf '{}' +
