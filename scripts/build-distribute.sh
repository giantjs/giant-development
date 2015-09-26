#!/usr/bin/env bash
set -e

# TODO: base condition on whether there are any tgz files present
if [[ $1 == assertion ]]; then
    giant-dev run $1 "grunt build && npm pack"
else
    giant-dev run $1 "npm install *.tgz; grunt build && npm pack"
fi

giant-dev run $1 "echo ../*/ | xargs -n 1 cp *.tgz"
