#!/usr/bin/env bash
set -e

if [[ $1 == namespace ]]; then
    giant-dev run $1 "grunt build && npm pack"
else
    giant-dev run $1 "npm install *.tgz; grunt build && npm pack"
fi

giant-dev run $1 "echo ../*/ | xargs -n 1 cp *.tgz"
