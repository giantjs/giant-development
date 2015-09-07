#!/usr/bin/env bash
set -e
cd modules
for f in * ; do
    if [[ -d $f ]]; then
        echo $f
    fi
done
cd ..
